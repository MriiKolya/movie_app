part of 'top_rated_movie_bloc.dart';

enum TopRatedMovieStatus {
  succes,
  error,
  initial,
  loading,
}

class TopRatedMovieState extends Equatable {
  final TopRatedMovieStatus status;
  final String textError;
  final List<MovieModel> listTopRatedMovie;
  const TopRatedMovieState({
    required this.status,
    required this.textError,
    required this.listTopRatedMovie,
  });

  factory TopRatedMovieState.initial() => const TopRatedMovieState(
        listTopRatedMovie: [],
        status: TopRatedMovieStatus.initial,
        textError: '',
      );
  factory TopRatedMovieState.loading() => const TopRatedMovieState(
        listTopRatedMovie: [],
        status: TopRatedMovieStatus.loading,
        textError: '',
      );
  factory TopRatedMovieState.error(String error) => TopRatedMovieState(
        listTopRatedMovie: const [],
        status: TopRatedMovieStatus.error,
        textError: error,
      );
  factory TopRatedMovieState.succes({
    required List<MovieModel> listTopRatedMovie,
  }) =>
      TopRatedMovieState(
        listTopRatedMovie: listTopRatedMovie,
        status: TopRatedMovieStatus.succes,
        textError: '',
      );

  @override
  List<Object> get props => [status, textError, listTopRatedMovie];
}
