//gate from domain layer and data layer
//we choice datasource from remote data source
//model from datasource and return to
//overite trendingrepositories
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/connection/network_info.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/data/datasource/trending_movie_remote_data_source.dart';
import 'package:movie_app/features/home/domain/entity/trending_entity.dart';
import 'package:movie_app/features/home/domain/repositories/trending_movie_repositories.dart';

class TrendingMovieRepositoriesImpl implements TrendingMovieRepositories {
  final TrendingMovieRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TrendingMovieRepositoriesImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<TrendingMovieEntity>>> getTrendingMovie() async {
    if (await networkInfo.isConnected) {
      try {
        final movies = await remoteDataSource.getTrendingMovies();
        return Right(movies);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      return Left(Failure(errMessage: 'No Internet connection'));
    }
  }
}