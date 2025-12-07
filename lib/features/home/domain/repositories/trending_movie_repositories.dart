import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/domain/entity/trending_entity.dart';

abstract class TrendingMovieRepositories {
  Future<Either<Failure, List<TrendingMovieEntity>>> getTrendingMovie();
}