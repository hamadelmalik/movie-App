import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  // Extra fields specific to MovieModel
  final String url;
  final String imdbCode;
  final String titleEnglish;
  final String titleLong;
  final String slug;
  final int runtime;
  final int likeCount;
  final String descriptionIntro;
  final String ytTrailerCode;
  final String language;
  final String mpaRating;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String largeCoverImage;
  final String dateUploaded;
  final int dateUploadedUnix;
  MovieModel({
    // inherited fields from MovieEntity
    required super.id,
    required super.title,
    required super.year,
    required super.rating,
    required super.genres,
    required super.descriptionFull,
    required super.mediumCoverImage,
    required super.torrent,

    // new fields for MovieModel
    required this.url,
    required this.imdbCode,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.runtime,
    required this.likeCount,
    required this.descriptionIntro,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.largeCoverImage,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  // Factory constructor to parse JSON
}
