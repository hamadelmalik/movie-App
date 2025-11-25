//call to method in repositories
// تشتقبل
//بترجع بنفس
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/params/params.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movie/domain/repositories/movie_repositories.dart';

class MovieDetailsUseCase {
  final MovieDetailsRepositories repositories;
  MovieDetailsUseCase({required this.repositories});

  Future<Either<Failure, MovieDetailsEntity>> call({ required MovieDetailsParams params}) {
    return repositories.getMovieDetails(params: params);
  }
}
