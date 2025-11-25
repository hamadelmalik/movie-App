//data from api

import 'package:movie_app/core/databases/api/api_consumer.dart';
import 'package:movie_app/core/databases/api/end_points.dart';
import 'package:movie_app/core/params/params.dart';
import 'package:movie_app/features/movie/data/models/movie_model.dart';

class MovieDetailsRemoteDataSource {
final ApiConsumer api;

MovieDetailsRemoteDataSource({required this.api});
      Future<MovieDetailsModel>getMovieDetails( MovieDetailsParams params)async{
//call api
       final response =await api.get("${EndPoints.movie}${params.id}?api_key=${EndPoints.apiKey}");
       return MovieDetailsModel.fromJson(response);

      }


}