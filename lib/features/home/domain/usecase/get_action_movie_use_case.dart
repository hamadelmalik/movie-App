import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/domain/entity/action_entity.dart';
import 'package:movie_app/features/home/domain/repositories/action_movie_repositories.dart';

class GetActionMovieUseCase {
  final ActionMovieRepositories actionMovieRepositories;

  GetActionMovieUseCase({required this.actionMovieRepositories});

  Future<Either<Failure, List<ActionMovieEntity>>> call() {
    return actionMovieRepositories.getActionMovie();
  }
}
