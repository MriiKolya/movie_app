import 'package:movie_app/core/domain/models/movie_models.dart';

abstract class IMovieRepository {
  Future<List<MovieModel>> getPopularityMovie();
  Future<List<MovieModel>> getUpcomingMovie();
}
