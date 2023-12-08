import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/repositories/auth_repository.dart';
import 'package:movie_app/features/screens/authorization/signup/cubit/signup_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final AuthRepository _repository;
  final SignupCubit signupCubit;
  VerificationCubit(this._repository, this.signupCubit)
      : super(VerificationState.initial());

  void tokenChanged(String value) {
    emit(state.copyWith(token: value, status: VerificationStatus.initial));
  }

  Future<void> confirmOtp() async {
    if (state.status == VerificationStatus.submitting) return;
    emit(state.copyWith(status: VerificationStatus.submitting));
    try {
      await _repository.confirmOtp(
          email: signupCubit.state.email, token: state.token);
      emit(state.copyWith(status: VerificationStatus.succes));
    } on AuthException {
      emit(state.copyWith(status: VerificationStatus.error));
    } catch (e) {
      emit(state.copyWith(status: VerificationStatus.error));
    }
  }

  Future<void> reSendOtp() async {
    if (state.codeStatus == CodeStatus.codesend) return;
    emit(state.copyWith(codeStatus: CodeStatus.codesend));
    try {
      await _repository.reSendOtp(email: signupCubit.state.email);
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(codeStatus: CodeStatus.initial));
      print('object');
    } on AuthException catch (e) {
      emit(state.copyWith(status: VerificationStatus.error));
      debugPrint(e.toString());
    } catch (e) {
      emit(state.copyWith(status: VerificationStatus.error));
      debugPrint(e.toString());
    }
  }
}
