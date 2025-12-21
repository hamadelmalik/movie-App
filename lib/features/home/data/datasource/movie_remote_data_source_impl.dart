import 'package:dio/dio.dart';
import 'package:movie_app/core/databases/api/end_points.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/home/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> getMovies(MovieParams params) async {
    final response = await dio.get(
      EndPoints.baseUrl + params.endpoint,
      queryParameters: {
        "api_key": EndPoints.apiKey,
        ...?params.query, // مهم جداً
      },
    );
    final results = (response.data['results'] as List?) ?? [];
    List<MovieModel> movies = [];

    for (var json in results) {
      movies.add(MovieModel.fromJson(json));
    }

    return movies;
  }
}
