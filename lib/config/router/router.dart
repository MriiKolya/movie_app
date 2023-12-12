import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/blocs/bloc/app_bloc.dart';
import 'package:movie_app/features/screens/authorization/login/view/login_screen.dart';
import 'package:movie_app/features/screens/authorization/reset_password/view/create_new_password_screen.dart';
import 'package:movie_app/features/screens/authorization/reset_password/view/reset_password_screen.dart';
import 'package:movie_app/features/screens/authorization/reset_password/view/verification_reset_password_screen.dart';
import 'package:movie_app/features/screens/authorization/signup/view/signup_screen.dart';
import 'package:movie_app/features/screens/authorization/signup/view/verification_signup_.dart';
import 'package:movie_app/features/screens/dashboard/view/dashboard_screen.dart';

import 'router_name.dart';

class AppRouter {
  final AppBloc authBloc;
  AppRouter({required this.authBloc});

  late final GoRouter router = GoRouter(
    initialLocation: '/dasboard',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/login',
        name: AppNameRouter.loginScreen,
        builder: (BuildContext contex, GoRouterState state) => LoginnScreen(),
      ),
      GoRoute(
        path: '/create_new_password',
        name: AppNameRouter.createNewPasswordScreen,
        builder: (BuildContext contex, GoRouterState state) =>
            const CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: '/reset_password',
        name: AppNameRouter.resetPasswordScreen,
        builder: (BuildContext contex, GoRouterState state) =>
            ReserPasswordScreen(),
      ),
      GoRoute(
        path: '/dasboard',
        name: AppNameRouter.dasboardScreen,
        builder: (BuildContext contex, GoRouterState state) =>
            const DashboardScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: AppNameRouter.signUpScreen,
        builder: (BuildContext contex, GoRouterState state) => SignUpScreen(),
      ),
      GoRoute(
        path: '/verification_reset_password',
        name: AppNameRouter.verificationResetPasswordlScreen,
        builder: (BuildContext contex, GoRouterState state) =>
            const VerificationResetPasswordScreen(),
      ),
      GoRoute(
        path: '/verification_signup',
        name: AppNameRouter.verificationSignUplScreen,
        builder: (BuildContext contex, GoRouterState state) =>
            const VerificationSignUplScreen(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      // Проверка, авторизован ли пользователь
      final bool loggedIn = authBloc.state.status == AppStatus.authenticated;

      // Разрешить навигацию на страницу dashboard только для авторизованных пользователей
      if (state.matchedLocation == '/dasboard' && !loggedIn) {
        return '/login';
      }

      // Разрешить навигацию на другие страницы для авторизованных пользователей
      if (!loggedIn) {
        return null;
      }

      // Разрешить навигацию для авторизованных пользователей
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    subscription =
        stream.asBroadcastStream().listen((event) => notifyListeners());
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
