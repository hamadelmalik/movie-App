import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/domain/entity/genres_entity.dart';

// Interface / Contract
abstract class GenresRepository {
  Future<Either<Failure, List<GenresEntity>>> getGenres();
}
