class MovieModel {
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? title;
  String? overview;
  double? popularity;
  num? voteAverage;
  String? releaseDate;
  String? posterPath;
  num? voteCount;

  MovieModel({
    required this.id,
    required this.originalLanguage,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.voteAverage,
    required this.releaseDate,
    required this.posterPath,
    required this.voteCount,
    required this.backdropPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      originalLanguage: json['original_language'],
      title: json['title'],
      overview: json['overview'],
      popularity: json['popularity'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      voteCount: json['vote_count'],
      backdropPath: json['backdrop_path'],
    );
  }
}
