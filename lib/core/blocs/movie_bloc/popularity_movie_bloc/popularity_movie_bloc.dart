import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/domain/models/movie_model.dart';
import 'package:movie_app/features/repositories/movie_repository.dart';

part 'popularity_movie_event.dart';
part 'popularity_movie_state.dart';

class PopularityMovieBloc
    extends Bloc<PopularityMovieEvent, PopularityMovieState> {
  final MovieRepository _repository;
  PopularityMovieBloc(MovieRepository repository)
      : _repository = repository,
        super(PopularityMovieState.initial()) {
    on<GetPopularMovie>(_onGetPopularMovie);
  }

  _onGetPopularMovie(event, emit) async {
    try {
      emit(PopularityMovieState.loading());
      final listPopularMovie = await _repository.getPopularityMovie();
      emit(PopularityMovieState.succes(listPopularMovie: listPopularMovie));
    } catch (e) {
      emit(PopularityMovieState.error(e.toString()));
    }
  }
}
