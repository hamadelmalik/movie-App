import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/params/params.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

abstract class MovieDetailsRepositories {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({required MovieDetailsParams params});
}
