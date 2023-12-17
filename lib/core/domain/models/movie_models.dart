import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_models.g.dart';

@JsonSerializable()
class MovieModel extends Equatable {
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  String get fullImageBackdropPath =>
      'https://image.tmdb.org/t/p/w500/$backdropPath';
  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  final String? title;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'vote_average')
  final num? voteAverage;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  String get fullImagePosterPath =>
      'https://image.tmdb.org/t/p/w500/$posterPath';
  @JsonKey(name: 'vote_count')
  final num? voteCount;

  const MovieModel({
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

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  MovieModel copyWith({
    final String? backdropPath,
    final int? id,
    final String? originalLanguage,
    final String? title,
    final String? overview,
    final double? popularity,
    final num? voteAverage,
    final String? releaseDate,
    final String? posterPath,
    final num? voteCount,
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
