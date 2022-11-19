part of 'genre_movie_bloc.dart';

abstract class GenreMovieState {
  const GenreMovieState();
}

class GenreMovieInitialState extends GenreMovieState {}

class GenreMovieLoadingState extends GenreMovieState {}

class GenreMovieDoneState extends GenreMovieState {
  const GenreMovieDoneState({
    required this.movies,
  });

  final List<GenredMovieEntity> movies;
}

class GenreMovieErrorState extends GenreMovieState {
  const GenreMovieErrorState({
    required this.error,
  });

  final SampleException error;
}
