part of 'verification_reset_password_cubit.dart';

enum VerificationResetPasswordStatus { initial, succes, error, submitting }

class VerificationResetPasswordState extends Equatable {
  final String token;
  final VerificationResetPasswordStatus status;
  const VerificationResetPasswordState({
    required this.token,
    required this.status,
  });

  factory VerificationResetPasswordState.initial() {
    return const VerificationResetPasswordState(
        token: '', status: VerificationResetPasswordStatus.initial);
  }

  VerificationResetPasswordState copyWith({
    String? token,
    VerificationResetPasswordStatus? status,
  }) {
    return VerificationResetPasswordState(
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status, token];
}
