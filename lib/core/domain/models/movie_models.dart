import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
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

  MovieModel copyWith({
    String? backdropPath,
    int? id,
    String? originalLanguage,
    String? title,
    String? overview,
    double? popularity,
    num? voteAverage,
    String? releaseDate,
    String? posterPath,
    num? voteCount,
  }) {
    return MovieModel(
      backdropPath: backdropPath ?? this.backdropPath,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
      posterPath: posterPath ?? this.posterPath,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        originalLanguage,
        title,
        overview,
        popularity,
        voteAverage,
        releaseDate,
        posterPath,
        voteCount,
      ];
}
