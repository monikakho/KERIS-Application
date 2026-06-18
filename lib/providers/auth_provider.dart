import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final onboardingIndexProvider = StateProvider<int>((ref) => 0);
final isFirstTimeProvider = StateProvider<bool>((ref) => true);

// Simpan apakah user memilih Mahasiswa (true) atau Mentor (false)
final authRoleProvider = StateProvider<bool>((ref) => true);

// Simpan visibilitas password
final obscureTextProvider = StateProvider<bool>((ref) => true);
final obscureConfirmTextProvider = StateProvider<bool>((ref) => true);

// Provider untuk index BottomNavigationBar di HomePage
final mainNavIndexProvider = StateProvider<int>((ref) => 0);
