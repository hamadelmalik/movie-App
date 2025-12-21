import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/home/data/repositories/movie_repository.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';

class GetMovieUseCase {
  final MovieRepository movieRepository;

  GetMovieUseCase({required this.movieRepository});

  Future<Either<Failure, List<MovieEntity>>> call(MovieParams params) {
    return movieRepository.getMovies(params);
  }
}
