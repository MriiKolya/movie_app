import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/domain/models/genres_movie_model.dart';
import 'package:movie_app/features/repositories/movie_repository.dart';

part 'genres_movie_event.dart';
part 'genres_movie_state.dart';

class GenresMovieBloc extends Bloc<GenresMovieEvent, GenresMovieState> {
  final MovieRepository _repository;
  GenresMovieBloc({required MovieRepository repository})
      : _repository = repository,
        super(GenresMovieState.initial()) {
    on<GetGenresMovie>(_onGetGenresMovie);
  }

  _onGetGenresMovie(event, emit) async {
    try {
      emit(GenresMovieState.loading());
      final listGenreMovie = await _repository.getGenresMovie();
      emit(GenresMovieState.succes(listGenreMovie: listGenreMovie));
    } catch (e) {
      emit(GenresMovieState.error(e.toString()));
    }
  }
}
