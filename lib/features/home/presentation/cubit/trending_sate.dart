import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/entity/trending_entity.dart';

import '../../domain/repositories/trending_movie_repositories.dart';

abstract class TrendingState {}

class TrendingStateInitial extends TrendingState {}

class GetTrendingLoading extends TrendingState {}

class GetTrendingFailure extends TrendingState {
  final String errMessage;

  GetTrendingFailure({required this.errMessage});
}

class GetTrendingSuccessfully extends TrendingState {
  final List<TrendingMovieEntity> trendingMovies;

  GetTrendingSuccessfully({required this.trendingMovies});
}

class TrendingCubit extends Cubit<TrendingState> {
  final TrendingMovieRepositories repository;

  TrendingCubit({required this.repository}) : super(TrendingStateInitial());

  /// جلب بيانات الأفلام
  Future<void> fetchTrendingMovies() async {
    emit(GetTrendingLoading());

    //  final result = await repository.getTrendingMovie();
  }
}
