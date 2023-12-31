import 'package:movie_app/core/domain/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IAuthRepository {
  Future<void> onResetPassword({
    required String email,
  });
  Future<void> reSendOtp({required String email, required OtpType type});
  Future<void> confirmOtp(
      {required String email, required String token, required OtpType type});
  Future<AuthResponse> onSignIn({
    required String email,
    required String password,
  });
  Future<AuthResponse> onSignUp({
    required String email,
    required String password,
    required String name,
  });
  // Future<void> onResetPassword({
  //   required String email,
  // });
  Future<void> onUpdateUser({
    required String email,
    required String password,
  });
  Stream<UserAuth?> getCurrentUser();
  Future<void> onSignWithGoogle();
  Future<void> onSignWithApple();
  Future<void> onSignWithFacebook();
  Future<void> onSignOut();
}
