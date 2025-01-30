import 'package:firebase_auth/firebase_auth.dart';
import 'package:joplate/domain/dto/login_input.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<void> signInWithEmailAndPassword(LoginInput input) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );
    } catch (e) {
      print(e);
    }
  }
}
