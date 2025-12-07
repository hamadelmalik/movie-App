import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/usecase/get_treding_movie.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_sate.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final GetTrendingMovieUseCase getTrendingMovieUseCase;

  TrendingCubit({required this.getTrendingMovieUseCase})
    : super(TrendingStateInitial());

  Future<void> fetchTrendingMovies() async {
    emit(GetTrendingLoading());
    final result = await getTrendingMovieUseCase();
    result.fold(
      (failure) => emit(GetTrendingFailure(errMessage: failure.errMessage)),
      (movies) => emit(GetTrendingSuccessfully(trendingMovies: movies)),
    );
  }
}
