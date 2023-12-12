import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/config/router/router.dart';
import 'package:movie_app/config/themes/dart_theme.dart';
import 'package:movie_app/core/blocs/bloc/app_bloc.dart';
import 'package:movie_app/features/screens/authorization/login/cubit/login_cubit.dart';
import 'package:movie_app/features/screens/authorization/reset_password/cubit/cubit_create_new_password/create_new_password_cubit.dart';
import 'package:movie_app/features/screens/authorization/reset_password/cubit/cubit_reset_password/reset_password_cubit.dart';
import 'package:movie_app/features/screens/authorization/reset_password/cubit/cubit_verification_reset_password/verification_reset_password_cubit.dart';
import 'package:movie_app/features/screens/authorization/signup/cubit/signup_cubit/signup_cubit.dart';
import 'package:movie_app/features/screens/authorization/signup/cubit/verification_signup/verification_signup_cubit.dart';

import 'features/repositories/auth_repository.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final signupCubit = SignupCubit(GetIt.I<AuthRepository>());
  final resetPasswordCubit =
      ResetPasswordCubit(repository: GetIt.I<AuthRepository>());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(GetIt.I<AuthRepository>())),
        BlocProvider<CreateNewPasswordCubit>(
            create: (context) => CreateNewPasswordCubit(
                repository: GetIt.I<AuthRepository>(),
                resetPasswordCubit: resetPasswordCubit)),
        BlocProvider<ResetPasswordCubit>(
            create: (context) => resetPasswordCubit),
        BlocProvider<SignupCubit>(create: (context) => signupCubit),
        BlocProvider<VerificationSignUpCubit>(
            create: (context) => VerificationSignUpCubit(
                repository: GetIt.I<AuthRepository>(),
                signupCubit: signupCubit)),
        BlocProvider<VerificationResetPasswordCubit>(
            create: (context) => VerificationResetPasswordCubit(
                repository: GetIt.I<AuthRepository>(),
                resetPasswordCubit: resetPasswordCubit)),
        BlocProvider(create: (context) => AppBloc(GetIt.I<AuthRepository>()))
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
            theme: dartTheme(),
            routerConfig: AppRouter(authBloc: context.read<AppBloc>()).router);
      }),
    );
  }
}
