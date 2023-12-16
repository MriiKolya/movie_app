part of 'genres_movie_bloc.dart';

enum GenreMovieStatus {
  succes,
  error,
  initial,
  loading,
}

class GenresMovieState extends Equatable {
  final List<GenresMovieModel> listGenreMovie;
  final GenreMovieStatus status;
  final String textError;
  const GenresMovieState({
    required this.textError,
    required this.listGenreMovie,
    required this.status,
  });

  factory GenresMovieState.initial() {
    return const GenresMovieState(
      listGenreMovie: [],
      status: GenreMovieStatus.initial,
      textError: '',
    );
  }

  factory GenresMovieState.succes({
    required List<GenresMovieModel> listGenreMovie,
  }) {
    return GenresMovieState(
      listGenreMovie: listGenreMovie,
      status: GenreMovieStatus.succes,
      textError: '',
    );
  }
  factory GenresMovieState.loading() {
    return const GenresMovieState(
      listGenreMovie: [],
      status: GenreMovieStatus.loading,
      textError: '',
    );
  }

  factory GenresMovieState.error(String textError) {
    return GenresMovieState(
        listGenreMovie: const [],
        status: GenreMovieStatus.error,
        textError: textError);
  }

  @override
  List<Object> get props => [status, listGenreMovie, textError];
}
