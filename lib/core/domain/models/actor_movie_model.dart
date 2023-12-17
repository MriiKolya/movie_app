import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/core/domain/models/movie_models.dart';

part 'actor_movie_model.g.dart';

@JsonSerializable()
class ActorMovie {
  final int? id;

  final int? gender;

  final String? name;

  @JsonKey(name: 'original_name')
  final String? originalName;

  @JsonKey(name: 'profile_path')
  final String? profilePath;
  String get fullImageProfilePath =>
      'https://image.tmdb.org/t/p/w500/$profilePath';
  @JsonKey(name: 'known_for')
  final List<MovieModel>? knownFor;

  ActorMovie({
    required this.id,
    required this.gender,
    required this.name,
    required this.originalName,
    required this.profilePath,
    this.knownFor,
  });

  factory ActorMovie.fromJson(Map<String, dynamic> json) =>
      _$ActorMovieFromJson(json);

  Map<String, dynamic> toJson() => _$ActorMovieToJson(this);
}
