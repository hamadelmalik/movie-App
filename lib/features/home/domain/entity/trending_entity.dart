class TrendingMovieEntity {
  final int id;
  final String title;
  final String? posterPath;
  final double rating;
  final String? releaseDate;

  TrendingMovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.releaseDate,
  });

  /// لتحديد هل الفيلم متاح للعرض أو لا
  bool get isAvailable => posterPath != null && posterPath!.isNotEmpty;
}
