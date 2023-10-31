import 'package:movies_app/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/models/recommended_movies_model/RecommendedMovieResponse.dart';

class TopRatedMoviesStates{}

class TopRatedMoviesLoading extends TopRatedMoviesStates{}

class TopRatedMoviesSuccess extends TopRatedMoviesStates{
  List<MovieDetails> topRatedMoviesList;
  TopRatedMoviesSuccess({required this.topRatedMoviesList});
}
class TopRatedMoviesFailure extends TopRatedMoviesStates{
  String? errorMessage;
  TopRatedMoviesFailure({required this.errorMessage});
}