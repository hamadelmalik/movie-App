import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/domain/entity/action_entity.dart';

abstract class ActionMovieRepositories {
  Future<Either<Failure, List<ActionMovieEntity>>> getActionMovie();
}
