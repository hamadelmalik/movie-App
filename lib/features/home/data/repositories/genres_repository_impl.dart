import 'package:dartz/dartz.dart';
import 'package:movie_app/core/connection/network_info.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/data/datasource/genres_remote_data_source.dart';
import 'package:movie_app/features/home/domain/entity/genres_entity.dart';
import 'package:movie_app/features/home/domain/repositories/genres_repositories.dart';

class GenresRepositoryImpl implements GenresRepository {
  final GenresRemoteDataSource genresRemoteDataSource;
  final NetworkInfo networkInfo;

  GenresRepositoryImpl({
    required this.genresRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<GenresEntity>>> getGenres() async {
    if (await networkInfo.isConnected) {
      try {
        // Call Remote Data Source
        final List<GenresEntity> genres = await genresRemoteDataSource
            .fetchGenres();

        return Right(genres);
      } catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      return Left(Failure(errMessage: 'No Internet connection'));
    }
  }
}
