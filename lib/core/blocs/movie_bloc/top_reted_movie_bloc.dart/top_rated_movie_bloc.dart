import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/domain/models/movie_models.dart';
import 'package:movie_app/features/repositories/movie_repository.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final MovieRepository _repository;
  TopRatedMovieBloc({required MovieRepository repository})
      : _repository = repository,
        super(TopRatedMovieState.initial()) {
    on<GetTopRatedMovie>(_onGetTopRatedMovie);
  }
  _onGetTopRatedMovie(event, emit) async {
    try {
      emit(TopRatedMovieState.loading());
      final listPopularMovie = await _repository.getTopRatedMovie();
      emit(TopRatedMovieState.succes(listTopRatedMovie: listPopularMovie));
    } catch (e) {
      emit(TopRatedMovieState.error(e.toString()));
    }
  }
}
