import 'package:dartz/dartz.dart';
import 'package:movie_app/core/connection/network_info.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/home/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/features/home/data/repositories/movie_repository.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';

class MovieRepositoryImpl implements MovieRepository {
  final NetworkInfo networkInfo;

  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({
    required this.movieRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies(
    MovieParams params,
  ) async {
    try {
      final movie = await movieRemoteDataSource.getMovies(params);
      return right(movie);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
