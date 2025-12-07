//1. call method in repositories

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/domain/entity/trending_entity.dart';
import 'package:movie_app/features/home/domain/repositories/trending_movie_repositories.dart';

class GetTrendingMovieUseCase {
  final TrendingMovieRepositories repository;

  GetTrendingMovieUseCase({required this.repository});

  Future<Either<Failure, List<TrendingMovieEntity>>> call() {
    return repository.getTrendingMovie();
  }
}
