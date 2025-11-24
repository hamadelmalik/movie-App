import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

abstract class MovieRepositories {
  Future<Either<Failure, MovieEntity>> getMovies();
}
