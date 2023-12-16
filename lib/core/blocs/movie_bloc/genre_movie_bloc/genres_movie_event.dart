part of 'genres_movie_bloc.dart';

sealed class GenresMovieEvent extends Equatable {
  const GenresMovieEvent();

  @override
  List<Object> get props => [];
}

class GetGenresMovie extends GenresMovieEvent {}
