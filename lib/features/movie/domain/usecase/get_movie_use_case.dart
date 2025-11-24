//call to method in repositories
// تشتقبل
//بترجع بنفس
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/params/params.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movie/domain/repositories/movie_repositories.dart';

class MovieUseCase {
  final MovieRepositories repositories;

  MovieUseCase(this.repositories);

  Future<Either<Failure, MovieEntity>> call({ required MovieParams params}) {
    return repositories.getMovies(params: params);
  }
}
