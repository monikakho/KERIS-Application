import 'package:firebase_auth/firebase_auth.dart';
import 'user_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserService _userService = UserService();

  // Register
  Future<UserCredential> registerWithEmail(String email, String password, String username) async {
    try {
      // 1. Buat user di Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        // 2. Simpan data tambahan di Firestore
        await _userService.createUserProfile(user.uid, {
          'username': username,
          'email': email,
          'role': 'mahasiswa', // default role
        });
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('Kata sandi terlalu lemah.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('Email sudah digunakan oleh akun lain.');
      } else {
        throw Exception(e.message ?? 'Terjadi kesalahan saat pendaftaran.');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  // Login dengan Email
  Future<UserCredential> loginWithEmail(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == 'invalid-credential') {
        throw Exception('Email atau kata sandi salah.');
      } else {
        throw Exception(e.message ?? 'Terjadi kesalahan saat login.');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  // Login dengan Username
  Future<UserCredential> loginWithUsername(String username, String password) async {
    try {
      final email = await _userService.getUserEmailByUsername(username);
      if (email == null) {
        throw Exception('Username tidak ditemukan.');
      }
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == 'invalid-credential') {
        throw Exception('Username atau kata sandi salah.');
      } else {
        throw Exception(e.message ?? 'Terjadi kesalahan saat login.');
      }
    } catch (e) {
      throw Exception(e.toString().replaceAll('Exception: ', ''));
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Gagal mengirim email reset password: $e');
    }
  }

  // Dapatkan Current User
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
