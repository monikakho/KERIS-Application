import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String username;
  final String email;
  final String? profileImageUrl;
  final String role;
  final String? activeBanner;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    this.profileImageUrl,
    required this.role,
    this.activeBanner,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      profileImageUrl: data['profileImageUrl'],
      role: data['role'] ?? 'mahasiswa',
      activeBanner: data['activeBanner'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'username': username,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'role': role,
      'activeBanner': activeBanner,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  UserModel copyWith({
    String? username,
    String? profileImageUrl,
    String? activeBanner,
  }) {
    return UserModel(
      uid: this.uid,
      username: username ?? this.username,
      email: this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      role: this.role,
      activeBanner: activeBanner ?? this.activeBanner,
      createdAt: this.createdAt,
      updatedAt: DateTime.now(), // Update time when copied for updates
    );
  }
}
