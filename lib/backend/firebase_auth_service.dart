import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login
  Future<String?> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return null; // null berarti sukses
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'Email tidak ditemukan.';
        case 'wrong-password':
          return 'Password salah.';
        case 'invalid-email':
          return 'Format email tidak valid.';
        default:
          return e.message ?? 'Terjadi kesalahan saat login.';
      }
    } catch (e) {
      return 'Kesalahan tidak diketahui: $e';
    }
  }

  // Reset Password
  Future<String?> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return null; // null berarti sukses
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Terjadi kesalahan saat mengirim email reset.';
    }
  }
}
