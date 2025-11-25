import 'package:movie_app/features/movie/domain/entities/subentity/genre_entity.dart';

class MovieEntity {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final GenreEntity genres;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
  });
}
