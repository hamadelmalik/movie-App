import 'package:movie_app/features/home/domain/entity/action_entity.dart';

abstract class ActionState {}

class ActionInitial extends ActionState {}

class ActionLoading extends ActionState {}

class ActionSuccess extends ActionState {
  final List<ActionMovieEntity> actionMovies;

  ActionSuccess({required this.actionMovies});
}

class ActionFailure extends ActionState {
  final String errMessage;

  ActionFailure({required this.errMessage});
}
