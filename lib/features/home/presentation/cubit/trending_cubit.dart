import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/usecase/get_treding_movie.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_sate.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final GetTrendingMovieUseCase getTrendingMovieUseCase;
  bool _hasFetched = false; // ✅ لمنع call متكرر
  TrendingCubit({required this.getTrendingMovieUseCase})
    : super(TrendingStateInitial());

  Future<void> fetchTrendingMovies() async {
    if (_hasFetched) {
      log("Data already fetched, skipping API call");
      return;
    }
    log("Fetching trending movies from API...");

    _hasFetched = true;
    emit(GetTrendingLoading());
    final result = await getTrendingMovieUseCase();
    result.fold(
      (failure) => emit(GetTrendingFailure(errMessage: failure.errMessage)),
      (movies) => emit(GetTrendingSuccessfully(trendingMovies: movies)),
    );
  }
}
