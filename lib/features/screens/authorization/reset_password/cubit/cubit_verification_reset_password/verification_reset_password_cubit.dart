import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/repositories/auth_repository.dart';

part 'confrim_email_for_reset_password_state.dart';

class VerificationResetPasswordCubit
    extends Cubit<VerificationResetPasswordState> {
  AuthRepository _repository;

  VerificationResetPasswordCubit({
    required AuthRepository repository,
  })  : _repository = repository,
        super(VerificationResetPasswordState.initial());

  void tokenChanged(String value) {
    emit(state.copyWith(
        token: value, status: VerificationResetPasswordStatus.initial));
  }
}
