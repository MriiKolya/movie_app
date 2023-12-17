import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/domain/models/actor_movie_model.dart';
import 'package:movie_app/features/repositories/movie_repository.dart';

part 'popular_actor_movie_event.dart';
part 'popular_actor_movie_state.dart';

class PopularActorMovieBloc
    extends Bloc<PopularActorMovieEvent, PopularActorMovieState> {
  final MovieRepository _repository;
  PopularActorMovieBloc({
    required MovieRepository repository,
  })  : _repository = repository,
        super(PopularActorMovieState.initial()) {
    on<GetListPopularActorMovie>(_onGetPopularMovieActor);
  }

  _onGetPopularMovieActor(event, emit) async {
    try {
      emit(PopularActorMovieState.loading());
      final listPopularMovieActor = await _repository.getListPopularActor();
      emit(PopularActorMovieState.succes(
          listPopularMovieActor: listPopularMovieActor));
    } catch (e) {
      emit(PopularActorMovieState.error(textError: e.toString()));
    }
  }
}
