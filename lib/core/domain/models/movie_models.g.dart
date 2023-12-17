// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteAverage: json['vote_average'] as num?,
      releaseDate: json['release_date'] as String?,
      posterPath: json['poster_path'] as String?,
      voteCount: json['vote_count'] as num?,
      backdropPath: json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate,
      'poster_path': instance.posterPath,
      'vote_count': instance.voteCount,
    };
