import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/models/actor_movie_model.dart';
import 'package:movie_app/core/domain/models/models.dart';
import 'package:movie_app/features/constant/constant_tmdb_url.dart';
import 'package:movie_app/features/repositories/repositories.dart';

class MovieRepository implements IMovieRepository {
  final Dio _dio;

  MovieRepository({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<List<MovieModel>> getPopularityMovie() async {
    try {
      final response = await _dio.get(TMDBUrl.popularMovieUrl);
      final List<MovieModel> dataList = (response.data['results'] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();
      return dataList;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovie() async {
    try {
      final response = await _dio.get(TMDBUrl.upcomingMovieUrl);
      final List<MovieModel> dataList = (response.data['results'] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();
      return dataList;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<GenresMovieModel>> getGenresMovie() async {
    try {
      final response = await _dio.get(TMDBUrl.genresMovieUrl);
      final List<GenresMovieModel> dataList = (response.data['genres'] as List)
          .map((json) => GenresMovieModel.fromJson(json))
          .toList();
      return dataList;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    try {
      final response = await _dio.get(TMDBUrl.topRatedMovieUrl);
      final List<MovieModel> dataList = (response.data['results'] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();
      return dataList;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ActorMovie>> getListPopularActor() async {
    try {
      final response = await _dio.get(TMDBUrl.popularListActorMovieUrl);

      final List<ActorMovie> dataList = (response.data['results'] as List)
          .map((json) => ActorMovie.fromJson(json))
          .toList();
      return dataList;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
