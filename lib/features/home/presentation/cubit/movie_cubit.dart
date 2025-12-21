import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';
import 'package:movie_app/features/home/domain/usecase/get_movie_use_caase.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetMovieUseCase getMovieUseCase;

  MovieCubit({required this.getMovieUseCase}) : super(MovieInitial());

  // 👈 نضيف cache لكل genre
  final Map<int, List<MovieEntity>> _cache = {};

  Future<void> fetchMoviesByGenre(int genreId) async {
    if (_cache.containsKey(genreId)) {
      emit(MovieSuccess(movies: _cache[genreId]!));
      return;
    }

    emit(MovieLoading());
    final result = await getMovieUseCase(
      MovieParams(
        endpoint: 'discover/movie', // بدون "/"
        query: {'with_genres': genreId, 'page': 1},
      ),
    );

    result.fold((failure) => emit(MovieError(message: failure.errMessage)), (
      movies,
    ) {
      _cache[genreId] = movies; // cache
      emit(MovieSuccess(movies: movies));
    });
  }
}
