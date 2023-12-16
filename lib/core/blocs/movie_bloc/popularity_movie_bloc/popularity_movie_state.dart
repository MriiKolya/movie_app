part of 'popularity_movie_bloc.dart';

enum PopularityMovieStatus {
  succes,
  error,
  initial,
  loading,
}

class PopularityMovieState extends Equatable {
  final PopularityMovieStatus status;
  final String textError;
  final List<MovieModel> listPopularMovie;
  const PopularityMovieState({
    required this.status,
    required this.textError,
    required this.listPopularMovie,
  });

  factory PopularityMovieState.initial() {
    return const PopularityMovieState(
      listPopularMovie: [],
      status: PopularityMovieStatus.initial,
      textError: '',
    );
  }

  factory PopularityMovieState.succes({
    required List<MovieModel> listPopularMovie,
  }) {
    return PopularityMovieState(
      listPopularMovie: listPopularMovie,
      status: PopularityMovieStatus.succes,
      textError: '',
    );
  }

  factory PopularityMovieState.loading() {
    return const PopularityMovieState(
      listPopularMovie: [],
      status: PopularityMovieStatus.loading,
      textError: '',
    );
  }

  factory PopularityMovieState.error(String textError) {
    return PopularityMovieState(
        listPopularMovie: const [],
        status: PopularityMovieStatus.error,
        textError: textError);
  }

  @override
  List<Object> get props => [status, textError, listPopularMovie];
}
