import 'package:movie_app/core/domain/models/actor_movie_model.dart';
import 'package:movie_app/core/domain/models/models.dart';

abstract class IMovieRepository {
  Future<List<MovieModel>> getPopularityMovie();
  Future<List<MovieModel>> getUpcomingMovie();
  Future<List<MovieModel>> getTopRatedMovie();
  Future<List<GenresMovieModel>> getGenresMovie();
  Future<List<ActorMovie>> getListPopularActor();
}
