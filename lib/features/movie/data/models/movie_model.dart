import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  final String? homepage;
  final int? budget;
  final int? revenue;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final bool? video;
  MovieDetailsModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.genres,
    required super.posterPath,
    this.homepage,
    this.budget,
    this.revenue,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.video,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? json["original_title"] ?? "",
      overview: json["overview"] ?? "",
      releaseDate: json["release_date"] ?? "",
      runtime: json["runtime"] ?? 0,
      genres: (json["genres"] as List<dynamic>?)
          ?.map((e) => e["name"] as String)
          .toList() ??
          [],
      homepage: json["homepage"],
      budget: json["budget"],
      revenue: json["revenue"],
      imdbId: json["imdb_id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      video: json["video"],
      posterPath: json["poster_path"] ?? "",
    );
  }


}

