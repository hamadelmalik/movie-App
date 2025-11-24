//call to method in repositories
// تشتقبل
//بترجع بنفس
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movie/domain/repositories/movie_repositories.dart';

class GetMovieUseCase{
final MovieRepositories repositories;
  GetMovieUseCase(this.repositories);

Future<Either<Failure, MovieEntity>>  call(){
      return repositories.getMovies();



    }


}