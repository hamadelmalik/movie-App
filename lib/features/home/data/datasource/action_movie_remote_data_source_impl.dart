import 'package:dio/dio.dart';
import 'package:movie_app/core/databases/api/end_points.dart';
import 'package:movie_app/features/home/data/datasource/action_movie_remote_datasource.dart';
import 'package:movie_app/features/home/domain/entity/action_entity.dart';

class ActionMovieRemoteDataSourceImpl implements ActionMovieRemoteDataSource {
  final Dio dio;

  ActionMovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ActionMovieEntity>> getActionMovies() async {
    final response = await dio.get(
      "${EndPoints.baseUrl}${EndPoints.action}&api_key=${EndPoints.apiKey}",
    );
    final data = response.data['results'] as List;
    return data.map((json) {
      return ActionMovieEntity(
        id: json['id'],
        title: json['title'] ?? '',
        posterPath: json['poster_path'] ?? '',
        rating: (json['vote_average'] as num).toDouble(),
      );
    }).toList();
  }
}
