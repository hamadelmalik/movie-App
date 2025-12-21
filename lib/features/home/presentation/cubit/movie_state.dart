import 'package:movie_app/features/home/domain/entity/movie_entity.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final List<MovieEntity> movies;

  MovieSuccess({required this.movies});
}

class MovieError extends MovieState {
  final String message;

  MovieError({required this.message});
}
