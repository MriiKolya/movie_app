import 'package:movie_app/core/domain/models/models.dart';

abstract class IMovieRepository {
  Future<List<MovieModel>> getPopularityMovie();
  Future<List<MovieModel>> getUpcomingMovie();
  Future<List<GenresMovieModel>> getGenresMovie();
}
