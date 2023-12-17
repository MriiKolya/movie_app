part of 'popular_actor_movie_bloc.dart';

enum PopularActorMovieStatus {
  succes,
  error,
  initial,
  loading,
}

class PopularActorMovieState extends Equatable {
  final String textError;
  final PopularActorMovieStatus status;
  final List<ActorMovie> listPopularMovieActor;

  const PopularActorMovieState({
    required this.textError,
    required this.status,
    required this.listPopularMovieActor,
  });

  factory PopularActorMovieState.initial() {
    return const PopularActorMovieState(
        status: PopularActorMovieStatus.initial,
        listPopularMovieActor: [],
        textError: '');
  }
  factory PopularActorMovieState.loading() {
    return const PopularActorMovieState(
        status: PopularActorMovieStatus.loading,
        listPopularMovieActor: [],
        textError: '');
  }
  factory PopularActorMovieState.succes({
    required List<ActorMovie> listPopularMovieActor,
  }) {
    return PopularActorMovieState(
        status: PopularActorMovieStatus.succes,
        listPopularMovieActor: listPopularMovieActor,
        textError: '');
  }
  factory PopularActorMovieState.error({
    required String textError,
  }) {
    return PopularActorMovieState(
        status: PopularActorMovieStatus.error,
        listPopularMovieActor: const [],
        textError: textError);
  }

  @override
  List<Object> get props => [status, textError, listPopularMovieActor];
}
