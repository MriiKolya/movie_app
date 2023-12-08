import 'package:dio/dio.dart';

class MovieRepository {
  final Dio dio;
  MovieRepository({required this.dio});
  Future<void> getPopularityMovie() async {}
}
