import 'package:movie_app/features/home/domain/entity/genres_entity.dart';

abstract class GenresState {}

class GenresInitial extends GenresState {}

class GenresLoading extends GenresState {}

class GenresSuccess extends GenresState {
  List<GenresEntity> genres;

  GenresSuccess({required this.genres});
}

class GenresError extends GenresState {
  final String message;

  GenresError({required this.message});
}
