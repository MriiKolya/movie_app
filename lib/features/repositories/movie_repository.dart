import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/constant/constant.dart';
import 'package:movie_app/features/domain/models/movie_model.dart';
import 'package:movie_app/features/repositories/repositories.dart';

class MovieRepository implements IMovieRepository {
  final Dio _dio;

  MovieRepository({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<List<Movie>> getPopularityMovie() async {
    try {
      final response = await _dio.get(Constant.urlPopularMoveTMDB);
      final List<Movie> dataList = (response.data['results'] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
      return dataList;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
