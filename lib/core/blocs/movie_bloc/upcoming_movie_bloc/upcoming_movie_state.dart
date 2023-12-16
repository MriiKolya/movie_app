part of 'upcoming_movie_bloc.dart';

enum UpcomingMovieStatus {
  succes,
  error,
  initial,
  loading,
}

class UpcomingMovieState extends Equatable {
  final UpcomingMovieStatus status;
  final String textError;
  final List<MovieModel> listUpcomingMovie;
  const UpcomingMovieState({
    required this.status,
    required this.textError,
    required this.listUpcomingMovie,
  });

  factory UpcomingMovieState.initial() {
    return const UpcomingMovieState(
      listUpcomingMovie: [],
      status: UpcomingMovieStatus.initial,
      textError: '',
    );
  }

  factory UpcomingMovieState.succes({
    required List<MovieModel> listUpcomingMovie,
  }) {
    return UpcomingMovieState(
      listUpcomingMovie: listUpcomingMovie,
      status: UpcomingMovieStatus.succes,
      textError: '',
    );
  }

  factory UpcomingMovieState.loading() {
    return const UpcomingMovieState(
      listUpcomingMovie: [],
      status: UpcomingMovieStatus.loading,
      textError: '',
    );
  }

  factory UpcomingMovieState.error(String textError) {
    return UpcomingMovieState(
        listUpcomingMovie: const [],
        status: UpcomingMovieStatus.error,
        textError: textError);
  }

  @override
  List<Object> get props => [status, textError, listUpcomingMovie];
}
