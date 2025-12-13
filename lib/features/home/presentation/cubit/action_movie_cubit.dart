import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/usecase/get_action_movie_use_case.dart';
import 'package:movie_app/features/home/presentation/cubit/action_move_state.dart';

class ActionCubit extends Cubit<ActionState> {
  final GetActionMovieUseCase getActionMovieUseCase;

  ActionCubit({required this.getActionMovieUseCase}) : super(ActionInitial());

  Future<void> fetchActionMovies() async {
    emit(ActionLoading());

    final result = await getActionMovieUseCase();
    result.fold(
      (failure) {
        emit(ActionFailure(errMessage: failure.errMessage));
      },
      (actionMovies) {
        emit(ActionSuccess(actionMovies: actionMovies));
      },
    );
  }
}
