import 'package:movie_app/features/home/domain/entity/trending_entity.dart';

abstract class TrendingMovieRemoteDataSource {
  Future<List<TrendingMovieEntity>> getTrendingMovies();
}