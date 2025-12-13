import 'package:movie_app/features/home/domain/entity/action_entity.dart';

//interface and contract
abstract class ActionMovieRemoteDataSource {
  Future<List<ActionMovieEntity>> getActionMovies();
}
