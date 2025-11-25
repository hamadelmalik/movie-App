
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}


final class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;  // <-- FIXED

  MovieDetailsLoaded({required this.movieDetails});
}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errMessage;

  MovieDetailsFailure({required this.errMessage});
}