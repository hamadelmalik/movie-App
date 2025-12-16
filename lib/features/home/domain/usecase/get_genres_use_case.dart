import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/domain/entity/genres_entity.dart';
import 'package:movie_app/features/home/domain/repositories/genres_repositories.dart';

class GetGenresUseCase {
  final GenresRepository genresRepository;

  GetGenresUseCase({required this.genresRepository});

  Future<Either<Failure, List<GenresEntity>>> call() {
    return genresRepository.getGenres();
  }
}
