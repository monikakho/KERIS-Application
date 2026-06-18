import 'package:cloud_firestore/cloud_firestore.dart';

class EnrollmentModel {
  final String id;
  final String userId;
  final String track;
  final String enrollCode;
  final DateTime enrolledAt;
  final String status;

  EnrollmentModel({
    required this.id,
    required this.userId,
    required this.track,
    required this.enrollCode,
    required this.enrolledAt,
    required this.status,
  });

  factory EnrollmentModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return EnrollmentModel(
      id: doc.id,
      userId: data['userId'] ?? '',
      track: data['track'] ?? '',
      enrollCode: data['enrollCode'] ?? '',
      enrolledAt: (data['enrolledAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      status: data['status'] ?? 'active',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'track': track,
      'enrollCode': enrollCode,
      'enrolledAt': Timestamp.fromDate(enrolledAt),
      'status': status,
    };
  }
}
