//1 check internet////
//2 response  model from datasource

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/connection/network_info.dart';
import 'package:movie_app/core/errors/expentions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/params/params.dart';
import 'package:movie_app/features/movie/data/datasource/model_remote_data_source.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movie/domain/repositories/movie_repositories.dart';

class MovieRepositoryImpl extends MovieRepositories {
  final NetworkInfo networkInfo;
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, MovieEntity>> getMovies({required MovieParams params}) async {
    try {
      if (await networkInfo.isConnected) {
        final remoteMovie = await remoteDataSource.getMovie(params);
        return Right(remoteMovie);
      } else {
        // لو مش متصل بالإنترنت
        return Left(Failure(errMessage: "No internet connection"));
      }
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    } catch (e) {
      // أي خطأ غير متوقع
      return Left(Failure(errMessage: "Unexpected error: $e"));
    }
  }
}
