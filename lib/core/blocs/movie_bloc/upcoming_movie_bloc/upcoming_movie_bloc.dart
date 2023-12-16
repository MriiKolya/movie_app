import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/domain/models/movie_models.dart';
import 'package:movie_app/features/repositories/movie_repository.dart';

part 'upcoming_movie_event.dart';
part 'upcoming_movie_state.dart';

class UpcomingMovieBloc extends Bloc<UpcomingMovieEvent, UpcomingMovieState> {
  final MovieRepository _repository;
  UpcomingMovieBloc(MovieRepository repository)
      : _repository = repository,
        super(UpcomingMovieState.initial()) {
    on<GetUpcomingMovie>(_onUpcomingMovie);
  }

  _onUpcomingMovie(event, emit) async {
    try {
      emit(UpcomingMovieState.loading());
      final listPopularMovie = await _repository.getUpcomingMovie();
      emit(UpcomingMovieState.succes(listUpcomingMovie: listPopularMovie));
    } catch (e) {
      emit(UpcomingMovieState.error(e.toString()));
    }
  }
}
