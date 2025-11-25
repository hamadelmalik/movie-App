import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app/core/databases/api/dio_consumer.dart';
import 'package:movie_app/features/movie/data/datasource/model_remote_data_source.dart';
import 'package:movie_app/features/movie/domain/usecase/get_movie_use_case.dart';
import 'movie_state.dart';
import 'package:movie_app/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/core/connection/network_info.dart';
import 'package:movie_app/core/params/params.dart';
import 'package:dio/dio.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  Future<void> eitherFailureOrMovie(int id) async {
    emit(MovieDetailsLoading());

    final failureOrMovieDetails = await MovieDetailsUseCase(
      repositories: MovieDetailsRepositoryImpl(
        remoteDataSource: MovieDetailsRemoteDataSource(api: DioConsumer(dio: Dio())),
        networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
      ),
    ).call(params: MovieDetailsParams(id: id));

    failureOrMovieDetails.fold(
          (failure) => emit(MovieDetailsFailure(errMessage: failure.errMessage)),
          (movie) => emit(MovieDetailsLoaded(movieDetails: movie)),
    );
  }
}
