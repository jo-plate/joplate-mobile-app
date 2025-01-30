import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _authService = FirebaseAuth.instance;

  AuthCubit() : super(const AuthState());




  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(state.copyWith(user: _authService.currentUser));
    } catch (e) {
      print(e);
    }
  }

//anonymous login
  Future<void> loginAnonymously() async {
    try {
      await _authService.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {}
}
