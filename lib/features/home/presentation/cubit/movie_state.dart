import 'package:movie_app/features/home/domain/entity/movie_entity.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final Map<String, List<MovieEntity>> moviesByEndpoint;
  MovieSuccess({required this.moviesByEndpoint});
}

class MovieByGenreSuccess extends MovieState {
  final Map<int, List<MovieEntity>> moviesByGenre;
  MovieByGenreSuccess({required this.moviesByGenre});
}

class MovieError extends MovieState {
  final String message;

  MovieError({required this.message});
}
