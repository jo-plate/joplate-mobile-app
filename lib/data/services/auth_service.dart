import 'package:joplate/domain/dto/login_input.dart';

abstract class AuthService {
  Future<void> signInWithEmail(LoginInput input);
}
