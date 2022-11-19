part of 'genre_movie_bloc.dart';

abstract class GenreMovieEvent {
  const GenreMovieEvent();
}

class GenreMovieInitialEvent extends GenreMovieEvent {}

class GenreMovieLoadEvent extends GenreMovieEvent {
  const GenreMovieLoadEvent({
    this.genreCode = 28,
  });

  final int? genreCode;
}
