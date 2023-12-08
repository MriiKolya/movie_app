import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/application.dart';
import 'package:movie_app/features/repositories/repositories.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://kvitivgeauvufkrjadcj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt2aXRpdmdlYXV2dWZrcmphZGNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEwMzAzNjgsImV4cCI6MjAxNjYwNjM2OH0.uBgCCgVtwwpnBjqyXvKdMM3jzYl0TftzFks4aemCaeo',
  );
  GetIt.I.registerLazySingleton(() => MovieRepository(dio: Dio()));
  GetIt.I.registerLazySingleton(() => AuthRepository());
  // GetIt.I.registerLazySingleton(() => IAuthenticationRepository());

  runApp(const Application());
}
