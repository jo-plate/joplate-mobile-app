part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  bool get isLoggedIn => user != null;

  const factory AuthState({
    User? user,
  }) = _AuthState;
}
