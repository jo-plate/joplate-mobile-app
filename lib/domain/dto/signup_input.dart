import 'package:freezed_annotation/freezed_annotation.dart';

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

  // TODO: Add validation
  bool get isValid => displayName.isNotEmpty && email.isNotEmpty && password.isNotEmpty && phonenumber.isNotEmpty;
}
