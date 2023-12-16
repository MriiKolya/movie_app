import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/models/movie_models.dart';
import 'package:movie_app/features/constant/constant.dart';
import 'package:movie_app/features/repositories/repositories.dart';

class MovieRepository implements IMovieRepository {
  final Dio _dio;

  MovieRepository({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<List<MovieModel>> getPopularityMovie() async {
    try {
      final response = await _dio.get(Constant.urlPopularMovieTMDB);
      final List<MovieModel> dataList =
          (response.data['results'] as List)
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
      final response = await _dio.get(Constant.urlUpcomingMovieTMDB);
      final List<MovieModel> dataList =
          (response.data['results'] as List)
              .map((json) => MovieModel.fromJson(json))
              .toList();
      return dataList;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
