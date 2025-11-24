import 'package:movie_app/features/movie/domain/entities/subentities/torrent_entity.dart';

class MovieEntity {
  final int id;
  final String title;
  final int year;
  final double rating;
  final List<String> genres; // <-- هنا
  final String descriptionFull;
  final String mediumCoverImage;
  final TorrentEntity torrent;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.genres, // <-- نمرّرها من الـ Model
    required this.descriptionFull,
    required this.mediumCoverImage,
    required this.torrent,
  });
}

// domain/entities/torrent_entity.dart

