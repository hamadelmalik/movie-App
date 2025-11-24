import 'package:movie_app/features/movie/data/models/submodel/torrent_entity.dart';
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

  /// Factory constructor to parse JSON
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      rating: (json['rating'] as num).toDouble(),
      genres: List<String>.from(json['genres']),
      descriptionFull: json['description_full'],
      mediumCoverImage: json['medium_cover_image'],
      torrent: TorrentModel.fromJson(json['torrent']),      url: json['url'],
      imdbCode: json['imdb_code'],
      titleEnglish: json['title_english'],
      titleLong: json['title_long'],
      slug: json['slug'],
      runtime: json['runtime'],
      likeCount: json['like_count'],
      descriptionIntro: json['description_intro'],
      ytTrailerCode: json['yt_trailer_code'],
      language: json['language'],
      mpaRating: json['mpa_rating'],
      backgroundImage: json['background_image'],
      backgroundImageOriginal: json['background_image_original'],
      smallCoverImage: json['small_cover_image'],
      largeCoverImage: json['large_cover_image'],
      dateUploaded: json['date_uploaded'],
      dateUploadedUnix: json['date_uploaded_unix'],
    );
  }

  /// Convert MovieModel back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'rating': rating,
      'genres': genres,
      'description_full': descriptionFull,
      'medium_cover_image': mediumCoverImage,
      'torrent': (torrent as TorrentModel).toJson(),

      'url': url,
      'imdb_code': imdbCode,
      'title_english': titleEnglish,
      'title_long': titleLong,
      'slug': slug,
      'runtime': runtime,
      'like_count': likeCount,
      'description_intro': descriptionIntro,
      'yt_trailer_code': ytTrailerCode,
      'language': language,
      'mpa_rating': mpaRating,
      'background_image': backgroundImage,
      'background_image_original': backgroundImageOriginal,
      'small_cover_image': smallCoverImage,
      'large_cover_image': largeCoverImage,
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }
}