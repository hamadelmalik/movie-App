class MovieParams {
  final String endpoint; // example: trending/popular/upcoming/...
  final Map<String, dynamic>? query;

  MovieParams({required this.endpoint, this.query});
}
