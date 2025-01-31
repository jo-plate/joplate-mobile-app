part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    User? user,
    bool? isLoading,
    String? errorMessage,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
        user: null,
        isLoading: false,
        errorMessage: null,
      );

  bool get isLoggedIn => user != null;
}
