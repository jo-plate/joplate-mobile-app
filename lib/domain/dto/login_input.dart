import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_input.freezed.dart';

@freezed
class LoginInput with _$LoginInput {
  const factory LoginInput({
    required String email,
    required String password,
  }) = _LoginInput;
}
