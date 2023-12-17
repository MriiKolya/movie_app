part of 'popular_actor_movie_bloc.dart';

sealed class PopularActorMovieEvent extends Equatable {
  const PopularActorMovieEvent();

  @override
  List<Object> get props => [];
}

class GetListPopularActorMovie extends PopularActorMovieEvent {}
