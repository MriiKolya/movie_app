import 'package:flutter/material.dart';

abstract class Constant {
  static const Color backgroundColor = Color(0xff18181b);
  static const secondBackgroundcolor = Color(0xff21222C);
  static const Color primaryColor = Color(0xff2E87F5);
  static const Color secondPrimaryColor = Color(0xff2BA4F5);
  static const Color exceptionColor = Color.fromARGB(255, 255, 51, 51);
  static const Color succesColor = Color(0xff4BB543);
  static const String apiKey = 'c539e23e4012f8d6e348b90f577dd3cf';
  static const String defaultProfilePhoto =
      'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651_1280.png';
  static const String urlPopularMovieTMDB =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  static const String urlUpcomingMovieTMDB =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
}
