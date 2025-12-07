import 'package:dio/dio.dart';
import 'package:movie_app/core/databases/api/end_points.dart';
import 'package:movie_app/features/home/data/datasource/trending_movie_remote_data_source.dart';
import 'package:movie_app/features/home/domain/entity/trending_entity.dart';

class TrendingMovieRemoteDataSourceImpl
    implements TrendingMovieRemoteDataSource {
  final Dio dio;

  TrendingMovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<TrendingMovieEntity>> getTrendingMovies() async {
    try {
      final response = await dio.get(
        EndPoints.baseUrl + EndPoints.trending,
        queryParameters: {'api_key': EndPoints.apiKey},
      );

      final data = (response.data['results'] as List?) ?? [];

      final movies = data
          .where((item) => item['media_type'] == 'movie')
          .map(
            (json) => TrendingMovieEntity(
              id: json['id'] ?? 0,
              title: json['title'] ?? 'No Title',
              posterPath: json['poster_path'] ?? '',
              rating: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
              releaseDate: json['release_date'] ?? '',
            ),
          )
          .toList();

      return movies;
    } catch (e) {
      throw Exception('Failed to fetch trending movies: $e');
    }
  }
}
