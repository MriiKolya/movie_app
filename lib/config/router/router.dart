import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/blocs/bloc/app_bloc.dart';
import 'package:movie_app/features/screens/authorization/confirm_email/view/confirm_email.dart';
import 'package:movie_app/features/screens/authorization/signup/view/signup_screen.dart';
import 'package:movie_app/features/screens/authorization/login/view/login_screen.dart';
import 'package:movie_app/features/screens/dashboard/view/dashboard_screen.dart';

class AppRouter {
  final AppBloc authBloc;
  AppRouter({required this.authBloc});

  static String nameLoginScreen = 'login';
  static String nameDasboardScreen = 'dasboard';
  static String nameSignUpScreen = 'signup';
  static String nameConfirmEmailScreen = 'confirm_email';

  late final GoRouter router = GoRouter(
    initialLocation: '/dasboard',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/login',
        name: nameLoginScreen,
        builder: (BuildContext contex, GoRouterState state) => LoginnScreen(),
      ),
      GoRoute(
        path: '/dasboard',
        name: nameDasboardScreen,
        builder: (BuildContext contex, GoRouterState state) =>
            const DashboardScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: nameSignUpScreen,
        builder: (BuildContext contex, GoRouterState state) => SignUpScreen(),
      ),
      GoRoute(
        path: '/confirm_email',
        name: nameConfirmEmailScreen,
        builder: (BuildContext contex, GoRouterState state) =>
            const ConfirmEmailScreen(),
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
