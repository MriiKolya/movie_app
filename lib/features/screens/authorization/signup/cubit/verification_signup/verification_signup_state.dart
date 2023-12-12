part of 'verification_signup_cubit.dart';

enum VerificationStatus { initial, succes, error, submitting }

enum CodeStatus { initial, codesend }

class VerificationSignUpState extends Equatable {
  final String email;
  final String token;
  final VerificationStatus status;
  final CodeStatus codeStatus;
  const VerificationSignUpState({
    required this.email,
    required this.token,
    required this.status,
    required this.codeStatus,
  });

  factory VerificationSignUpState.initial() {
    return const VerificationSignUpState(
      email: '',
      token: '',
      codeStatus: CodeStatus.initial,
      status: VerificationStatus.initial,
    );
  }

  VerificationSignUpState copyWith({
    String? email,
    String? token,
    VerificationStatus? status,
    CodeStatus? codeStatus,
  }) {
    return VerificationSignUpState(
      codeStatus: codeStatus ?? this.codeStatus,
      email: email ?? this.email,
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, token, status, codeStatus];
}
