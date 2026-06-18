import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/enrollment_model.dart';

class EnrollService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 1. Memvalidasi apakah kode cocok dengan jalur/track dan berstatus aktif
  Future<Map<String, dynamic>?> validateEnrollCode(String code, String track) async {
    try {
      // Mengambil data kode langsung menggunakan Document ID (Kodenya)
      DocumentSnapshot doc = await _firestore.collection('enroll_codes').doc(code).get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        
        // Memastikan track sesuai dan kode dalam status aktif dibuka
        if (data['track'] == track && data['isActive'] == true) {
          return {
            'id': doc.id,
            ...data,
          };
        }
      }
      return null;
    } catch (e) {
      print("Error ketika validasi kode: $e");
      return null;
    }
  }

  // 2. Melakukan proses pendaftaran (Mengunci 1 user hanya memiliki 1 dokumen enrollment)
  Future<void> enrollUser(String uid, String codeId, String code, String track) async {
    // ID Dokumen pendaftaran disamakan dengan UID User agar tidak bisa mendaftar dobel
    final enrollRef = _firestore.collection('enrollments').doc(uid);

    // Membuat objek model pendaftaran baru
    final newEnrollment = EnrollmentModel(
      id: uid, 
      userId: uid,
      track: track,
      enrollCode: code,
      enrolledAt: DateTime.now(),
      status: 'active',
    );

    final dataMap = newEnrollment.toFirestore();
    // Menggunakan server timestamp Firebase agar pencatatan waktu akurat di server
    dataMap['enrolledAt'] = FieldValue.serverTimestamp(); 

    // Tulis/Overwrite dokumen enrollment milik user tersebut
    await enrollRef.set(dataMap);
  }

  // 3. Mendapatkan stream enrollment yang sedang aktif untuk seorang user
  Stream<EnrollmentModel?> getUserActiveEnrollment(String uid) {
    return _firestore
        .collection('enrollments')
        .doc(uid) // Langsung membaca spesifik ke dokumen berbasis UID user
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data() as Map<String, dynamic>;
        if (data['status'] == 'active') {
          return EnrollmentModel.fromFirestore(snapshot);
        }
      }
      return null;
    });
  }
}