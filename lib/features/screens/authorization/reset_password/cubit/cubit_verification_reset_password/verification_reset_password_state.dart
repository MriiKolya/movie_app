part of 'verification_reset_password_cubit.dart';

enum VerificationResetPasswordStatus { initial, succes, error, submitting }

class VerificationResetPasswordState extends Equatable {
  final String token;
  final VerificationResetPasswordStatus status;
  final CodeStatus codeStatus;
  const VerificationResetPasswordState({
    required this.token,
    required this.status,
    required this.codeStatus,
  });

  factory VerificationResetPasswordState.initial() {
    return const VerificationResetPasswordState(
      token: '',
      status: VerificationResetPasswordStatus.initial,
      codeStatus: CodeStatus.initial,
    );
  }

  VerificationResetPasswordState copyWith({
    String? token,
    VerificationResetPasswordStatus? status,
    CodeStatus? codeStatus,
  }) {
    return VerificationResetPasswordState(
      token: token ?? this.token,
      status: status ?? this.status,
      codeStatus: codeStatus ?? this.codeStatus,
    );
  }

  @override
  List<Object> get props => [status, token, codeStatus];
}
