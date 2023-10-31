import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/view_model/top_rated_movies/Cubit/top_rated_movies_states.dart';
import 'package:movies_app/services/api_services.dart';

class TopRatedMoviesViewModel extends Cubit<TopRatedMoviesStates>{
  TopRatedMoviesViewModel():super(TopRatedMoviesLoading());
 Future <void> getRecommendedMovies() async{
    emit(TopRatedMoviesLoading());
    try{
      var response = await ApiService.getRecommendedMovies();
      if (response.statusCode != null) {
        emit(TopRatedMoviesFailure(errorMessage: response.statusMessage!));
      } else {
        emit(TopRatedMoviesSuccess(topRatedMoviesList: response.results ?? []));
      }
    }
    catch (e){
      rethrow;
    }
  }

}