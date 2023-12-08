import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/features/domain/models/user_model.dart';
import 'package:movie_app/features/repositories/interface_auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository extends ChangeNotifier implements IAuthRepository {
  final _supabase = Supabase.instance.client;
  bool isAuthenticated = false;

  User? getSignedInUser() => _supabase.auth.currentUser;

  @override
  Stream<UserAuth> getCurrentUser() =>
      _supabase.auth.onAuthStateChange.map((event) {
        if (event.session?.user == null) {
          return UserAuth.empty;
        } else {
          return UserAuth(
              id: event.session!.user.id, email: event.session!.user.email);
        }
      });

  @override
  Future<AuthResponse> onSignIn({
    required String email,
    required String password,
  }) async {
    final responce = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    isAuthenticated = true;
    notifyListeners();
    return responce;
  }

  @override
  Future<AuthResponse> onSignUp({
    required String email,
    required String password,
    required String name,
  }) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {'username': name},
    );
  }

  @override
  Future<void> confirmOtp(
      {required String email, required String token}) async {
    await _supabase.auth.verifyOTP(
      token: token,
      type: OtpType.signup,
      email: email,
    );
  }

  @override
  Future<void> reSendOtp({required String email}) async {
    await _supabase.auth.resend(
      type: OtpType.signup,
      email: email,
    );
  }

  @override
  Future<void> onResetPassword({
    required String email,
  }) async {
    await _supabase.auth.signInWithOtp(
      email: email,
    );
  }

  @override
  Future<void> onSignWithApple() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '33432227314-qdmqk7gtbkgqo2ajbp5o0027mgt7h775.apps.googleusercontent.com',
      serverClientId:
          '33432227314-m9ufts20u0qtnvul03gcevi54nukcrc5.apps.googleusercontent.com',
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    _supabase.auth.signInWithIdToken(
      provider: Provider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Future<void> onSignWithFacebook() async {
    await _supabase.auth.signInWithOAuth(
      Provider.facebook,
    );
  }

  @override
  Future<void> onSignWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '33432227314-qdmqk7gtbkgqo2ajbp5o0027mgt7h775.apps.googleusercontent.com',
      serverClientId:
          '33432227314-m9ufts20u0qtnvul03gcevi54nukcrc5.apps.googleusercontent.com',
    );
    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final accessToken = googleAuth.accessToken;
        final idToken = googleAuth.idToken;
        await _supabase.auth.signInWithIdToken(
          provider: Provider.google,
          idToken: idToken!,
          accessToken: accessToken,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> onSignOut() async => await _supabase.auth.signOut();
}
