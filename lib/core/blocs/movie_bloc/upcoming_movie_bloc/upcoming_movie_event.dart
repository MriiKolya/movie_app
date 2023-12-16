part of 'upcoming_movie_bloc.dart';

sealed class UpcomingMovieEvent extends Equatable {
  const UpcomingMovieEvent();

  @override
  List<Object> get props => [];
}

class GetUpcomingMovie extends UpcomingMovieEvent {}
