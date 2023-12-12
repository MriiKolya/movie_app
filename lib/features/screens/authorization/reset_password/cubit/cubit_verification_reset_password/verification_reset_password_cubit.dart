import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/repositories/auth_repository.dart';
import 'package:movie_app/features/screens/authorization/reset_password/cubit/cubit_reset_password/reset_password_cubit.dart';
import 'package:movie_app/features/screens/authorization/signup/cubit/verification_signup/verification_signup_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'verification_reset_password_state.dart';

class VerificationResetPasswordCubit
    extends Cubit<VerificationResetPasswordState> {
  final AuthRepository _repository;
  final ResetPasswordCubit resetPasswordCubit;

  VerificationResetPasswordCubit({
    required this.resetPasswordCubit,
    required AuthRepository repository,
  })  : _repository = repository,
        super(VerificationResetPasswordState.initial());

  void tokenChanged(String value) {
    emit(state.copyWith(
        token: value, status: VerificationResetPasswordStatus.initial));
  }

  Future<void> confirmOtp() async {
    if (state.status == VerificationResetPasswordStatus.submitting) return;
    emit(state.copyWith(status: VerificationResetPasswordStatus.submitting));
    try {
      await _repository.confirmOtp(
        email: resetPasswordCubit.state.email,
        token: state.token,
        type: OtpType.recovery,
      );

      emit(state.copyWith(status: VerificationResetPasswordStatus.succes));
    } on AuthException {
      emit(state.copyWith(status: VerificationResetPasswordStatus.error));
    } catch (e) {
      emit(state.copyWith(status: VerificationResetPasswordStatus.error));
    }
  }

  Future<void> reSendOtp() async {
    if (state.codeStatus == CodeStatus.codesend) return;
    emit(state.copyWith(codeStatus: CodeStatus.codesend));
    try {
      await _repository.reSendOtp(
        email: resetPasswordCubit.state.email,
        type: OtpType.signup,
      );
      await Future.delayed(const Duration(seconds: 10));
      emit(state.copyWith(codeStatus: CodeStatus.initial));
    } on AuthException catch (e) {
      emit(state.copyWith(codeStatus: CodeStatus.initial));
      emit(state.copyWith(status: VerificationResetPasswordStatus.error));
      debugPrint(e.toString());
    } catch (e) {
      emit(state.copyWith(codeStatus: CodeStatus.initial));
      emit(state.copyWith(status: VerificationResetPasswordStatus.error));
      debugPrint(e.toString());
    }
  }
}
