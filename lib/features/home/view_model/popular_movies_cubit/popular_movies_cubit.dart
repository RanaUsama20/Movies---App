import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/services/api_services.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit() : super(PopularMoviesLoading());
  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoading());
    try {
      var response = await ApiService.getPopularMovies();
      if (response.statusCode != null) {
        emit(PopularMoviesFailure(errorMessage: response.statusMessage!));
      } else {
        emit(PopularMoviesSuccess(movies: response.results ?? []));
      }
    } on SocketException catch (e) {
      emit(PopularMoviesFailure(errorMessage: "No internet connection."));
    } catch (e) {
      emit(PopularMoviesFailure(errorMessage: e.toString()));
    }
  }
}
