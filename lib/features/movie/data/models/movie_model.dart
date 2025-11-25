import 'package:movie_app/features/movie/data/models/submodel/genre_model.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final String? homepage;
  final int? budget;
  final int? revenue;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final bool? video;
  MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.genres,
    this.homepage,
    this.budget,
    this.revenue,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.video,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? json["original_title"] ?? "",
      overview: json["overview"] ?? "",
      releaseDate: json["release_date"] ?? "",
      runtime: json["runtime"] ?? 0,
      genres: GenreModel.fromJson( json["name"] ),
      homepage: json["homepage"],
      budget: json["budget"],
      revenue: json["revenue"],
      imdbId: json["imdb_id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      video: json["video"],
    );
  }

}

