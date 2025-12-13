import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app/core/connection/network_info.dart';
import 'package:movie_app/features/home/data/datasource/action_movie_remote_data_source_impl.dart';
import 'package:movie_app/features/home/data/datasource/action_movie_remote_datasource.dart';
import 'package:movie_app/features/home/data/datasource/trending_movie_remote_data_source.dart';
import 'package:movie_app/features/home/data/datasource/trending_movie_remote_data_source_impl.dart';
import 'package:movie_app/features/home/data/repositories/action_movie_repositories_impl.dart';
import 'package:movie_app/features/home/data/repositories/trending_movie_repositories_impl.dart';
import 'package:movie_app/features/home/domain/repositories/action_movie_repositories.dart';
import 'package:movie_app/features/home/domain/repositories/trending_movie_repositories.dart';
import 'package:movie_app/features/home/domain/usecase/get_action_movie_use_case.dart';
import 'package:movie_app/features/home/domain/usecase/get_treding_movie.dart';
import 'package:movie_app/features/home/presentation/cubit/action_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton(() => Dio());
  // Network Info
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionChecker()),
  );

  // Remote Data Source

  sl.registerLazySingleton<TrendingMovieRemoteDataSource>(
        () => TrendingMovieRemoteDataSourceImpl(dio: sl()),
  );
//------------------------------------//
  sl.registerLazySingleton<ActionMovieRemoteDataSource>(
        () => ActionMovieRemoteDataSourceImpl(dio: sl()),
  );

  //action datasource

  // Repository Trending
  sl.registerLazySingleton<TrendingMovieRepositories>(
    () => TrendingMovieRepositoriesImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
//---------------------ActionMovieRepositories---------------//
  sl.registerLazySingleton<ActionMovieRepositories>(
        () =>
        ActionMovieRepositoriesImpl(
          actionMovieRemoteDataSource: sl(),
          networkInfo: sl(),
        ),
  );
  // UseCase
  sl.registerLazySingleton(() => GetTrendingMovieUseCase(repository: sl()));
//------------------------------------//
  sl.registerLazySingleton(() =>
      GetActionMovieUseCase(actionMovieRepositories: sl()));

  // Cubit
  sl.registerFactory(() => TrendingCubit(getTrendingMovieUseCase: sl()));

  //------------------------------------//

  sl.registerFactory(() => ActionCubit(getActionMovieUseCase: sl()));

}
