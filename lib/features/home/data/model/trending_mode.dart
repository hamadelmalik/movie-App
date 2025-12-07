import 'package:movie_app/features/home/domain/entity/trending_entity.dart';

//extend from trendingEntity AMD CONVERT toJson and fromJson
class TrendingMovieModel extends TrendingMovieEntity {
  TrendingMovieModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.rating,
    required super.releaseDate,
  });

  factory TrendingMovieModel.fromJson(Map<String, dynamic> json) {
    return TrendingMovieModel(
      id: json["id"],
      title: json["title"] ?? json["name"] ?? "",
      // movie or tv
      posterPath: json["poster_path"],
      rating: (json["vote_average"] ?? 0).toDouble(),
      releaseDate:
          json["release_date"] ?? json["first_air_date"], // movie or tv
    );
  }
}
