import 'package:movie_app/core/databases/api/api_consumer.dart';
import 'package:movie_app/core/databases/api/end_points.dart';
import 'package:movie_app/features/home/data/model/trending_mode.dart';

class TrendingMovieRemoteDataSource {
  final ApiConsumer api;

  TrendingMovieRemoteDataSource({required this.api});

  Future<TrendingMovieModel> getTrendingMovie() async {
    //we must ro call api
    final response = await api.get(
      "${EndPoints.trending}?api_key=${EndPoints.apiKey}",
    );
    return TrendingMovieModel.fromJson(response);
  }
}
