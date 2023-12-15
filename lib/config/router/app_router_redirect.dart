import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/blocs/app_bloc/app_bloc.dart';

appRedirect({
  required BuildContext context,
  required GoRouterState state,
  required AppBloc authBloc,
}) {
  // Проверка, авторизован ли пользователь
  final bool loggedIn = authBloc.state.status == AppStatus.authenticated;
  // Разрешить навигацию на страницу dashboard только для авторизованных пользователей
  if (state.matchedLocation == '/profile' && !loggedIn) {
    return '/login';
  }
  // Разрешить навигацию на другие страницы для авторизованных пользователей
  if (!loggedIn) {
    return null;
  }
  // Разрешить навигацию для авторизованных пользователей
  return null;
}
