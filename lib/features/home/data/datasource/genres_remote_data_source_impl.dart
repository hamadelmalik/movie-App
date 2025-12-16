import 'package:dio/dio.dart';
import 'package:movie_app/core/databases/api/end_points.dart';
import 'package:movie_app/features/home/data/datasource/genres_remote_data_source.dart';
import 'package:movie_app/features/home/data/model/genres_model.dart';

class GenresRemoteDataSourceImpl implements GenresRemoteDataSource {
  final Dio dio;

  GenresRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<GenresModel>> fetchGenres() async {
    final response = await dio.get(
      "${EndPoints.baseUrl}${EndPoints.genre}?api_key=${EndPoints.apiKey}",
    );

    final data = response.data;
    final genresList = (data['genres'] as List)
        .map((json) => GenresModel.fromJson(json))
        .toList();
    return genresList;
  }
}
