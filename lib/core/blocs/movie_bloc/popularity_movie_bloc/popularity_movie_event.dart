part of 'popularity_movie_bloc.dart';

sealed class PopularityMovieEvent extends Equatable {
  const PopularityMovieEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMovie extends PopularityMovieEvent {}
