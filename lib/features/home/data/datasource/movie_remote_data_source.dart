import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';

//interface
abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovies(MovieParams params);
}
