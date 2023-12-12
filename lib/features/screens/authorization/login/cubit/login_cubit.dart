import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _repository;
  LoginCubit(this._repository) : super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future<void> logIn() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _repository.onSignIn(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: LoginStatus.succes));
    } on AuthException catch (e) {
      emit(state.copyWith(status: LoginStatus.error));
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
