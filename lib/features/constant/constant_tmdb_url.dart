abstract class TMDBUrl {
  static const String apiKey = 'c539e23e4012f8d6e348b90f577dd3cf';
  static const String popularMovieUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  static const String upcomingMovieUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  static const String genresMovieUrl =
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey';
  static const String topRatedMovieUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
  static const String popularListActorMovieUrl =
      'https://api.themoviedb.org/3/person/popular?api_key=$apiKey';
  // static const String httpImage = 'https://image.tmdb.org/t/p/w500/';
}
