//gate from domain layer and data layer
//we choice datasource from remote data source
//model from datasource and return to
//overite trendingrepositories
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/connection/network_info.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/data/datasource/action_movie_remote_datasource.dart';
import 'package:movie_app/features/home/domain/entity/action_entity.dart';
import 'package:movie_app/features/home/domain/repositories/action_movie_repositories.dart';

class ActionMovieRepositoriesImpl implements ActionMovieRepositories {
  final ActionMovieRemoteDataSource actionMovieRemoteDataSource;
  final NetworkInfo networkInfo;

  ActionMovieRepositoriesImpl({
    required this.actionMovieRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ActionMovieEntity>>> getActionMovie() async {
    if (await networkInfo.isConnected) {
      try {
        final movies = await actionMovieRemoteDataSource.getActionMovies();
        return Right(movies);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      return Left(Failure(errMessage: 'No Internet connection'));
    }
  }
}
