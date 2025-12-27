import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';
import 'package:movie_app/features/home/domain/usecase/get_movie_use_caase.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetMovieUseCase getMovieUseCase;

  MovieCubit({required this.getMovieUseCase}) : super(MovieInitial());

  // 👈 Cache لكل endpoint أو genre
  final Map<String, List<MovieEntity>> _cache = {};

  /// Fetch movies by endpoint key (مثلاً 'trending', 'action', 'genre_28', ...)
  Future<void> fetchMovies(String key, MovieParams params) async {
    // إذا موجودة في الكاش
    if (_cache.containsKey(key)) {
      emit(MovieSuccess(moviesByEndpoint: {..._cache}));
      return;
    }

    emit(MovieLoading());

    final result = await getMovieUseCase(params);

    result.fold(
          (failure) => emit(MovieError(message: failure.errMessage)),
          (movies) {
        _cache[key] = movies; // خزّن في الكاش
        emit(MovieSuccess(moviesByEndpoint: {..._cache}));
      },
    );
  }

  /// Fetch movies by genre specifically
  Future<void> fetchMoviesByGenre(int genreId) async {
    final key = 'genre_$genreId';

    // إذا موجودة في الكاش
    if (_cache.containsKey(key)) {
      emit(MovieSuccess(moviesByEndpoint: {..._cache}));
      return;
    }

    emit(MovieLoading());

    final result = await getMovieUseCase(
      MovieParams(
        endpoint: 'discover/movie', // بدون "/"
        query: {'with_genres': genreId, 'page': 1},
      ),
    );

    result.fold(
          (failure) => emit(MovieError(message: failure.errMessage)),
          (movies) {
        _cache[key] = movies; // خزّن في الكاش
        emit(MovieSuccess(moviesByEndpoint: {..._cache}));
      },
    );
  }

  /// للحصول على قائمة الأفلام من الكاش بسهولة
  List<MovieEntity> getMoviesByKey(String key) {
    return _cache[key] ?? [];
  }
}
