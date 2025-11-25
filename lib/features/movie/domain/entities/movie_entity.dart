class MovieDetailsEntity {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final List<String> genres;
  final String posterPath;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
    required this.posterPath,
  });
}
