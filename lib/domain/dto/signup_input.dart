import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/dto/login_input.dart';

part 'signup_input.freezed.dart';

@freezed
class SignupInput with _$SignupInput {
  const SignupInput._();

  const factory SignupInput({
    required String displayName,
    required String email,
    required String password,
    required String phonenumber,
  }) = _SignupInput;

  factory SignupInput.empty() => const SignupInput(
        displayName: '',
        email: '',
        password: '',
        phonenumber: '',
      );

  bool get isValid => displayName.isNotEmpty && email.isNotEmpty && password.isNotEmpty && phonenumber.isNotEmpty;

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'email': email,
      'password': password,
      'phonenumber': phonenumber,
    };
  }

  LoginInput toLoginInput() {
    return LoginInput(
      email: email,
      password: password,
    );
  }
}
