import 'package:movie_app/features/home/data/model/genres_model.dart';

//interface  or contract
abstract class GenresRemoteDataSource {
  Future<List<GenresModel>> fetchGenres();
}
