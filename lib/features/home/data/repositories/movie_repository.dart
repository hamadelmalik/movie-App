//🧱 الخطوة 1: تعريف Repository (interface)

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';

//🧱 الخطوة 1: تعريف Repository (interface)
abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovies(MovieParams params);
}
