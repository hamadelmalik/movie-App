import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/usecase/get_genres_use_case.dart';
import 'package:movie_app/features/home/presentation/cubit/genres_sate.dart';

class GenresCubit extends Cubit<GenresState> {
  final GetGenresUseCase getGenresUseCase;

  GenresCubit({required this.getGenresUseCase}) : super(GenresInitial());

  Future<void> fetchGenres() async {
    emit(GenresLoading());
    final result = await getGenresUseCase();

    result.fold(
      (failure) => emit(GenresError(message: failure.errMessage)),
      (genres) => emit(GenresSuccess(genres: genres)),
    );
  }
}
