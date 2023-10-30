import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/services/api_services.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesLoading());

  Future<void> getSimilarMovies(int movieId) async {
    emit(SimilarMoviesLoading());
    try {
      var response = await ApiService.getSimilarMovies(movieId);
      if (response.statusCode != null) {
        emit(SimilarMoviesFailure(errorMessage: response.statusMessage!));
      } else {
        emit(SimilarMoviesSucces(movies: response.results ?? []));
      }
    } on SocketException catch (e) {
      emit(SimilarMoviesFailure(errorMessage: "No internet connection."));
    } catch (e) {
      emit(SimilarMoviesFailure(errorMessage: e.toString()));
    }
  }
}
