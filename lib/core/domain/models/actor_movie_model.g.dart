// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorMovie _$ActorMovieFromJson(Map<String, dynamic> json) => ActorMovie(
      id: json['id'] ?? "",
      gender: json['gender'] ?? "",
      name: json['name'] ?? "",
      originalName: json['original_name'] ?? "",
      profilePath: json['profile_path'] ?? "",
    );

Map<String, dynamic> _$ActorMovieToJson(ActorMovie instance) =>
    <String, dynamic>{
      // 'id': instance.id,
      'gender': instance.gender,
      'name': instance.name,
      'original_name': instance.originalName,
      'profile_path': instance.profilePath,
    };
