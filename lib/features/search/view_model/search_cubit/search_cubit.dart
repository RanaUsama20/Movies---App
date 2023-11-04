import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/services/api_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void getMoviesBySearchQuery(String query) async {
    emit(SearchLoading());

    try {
      var response = await ApiService.getMoviesBySearchQuery(query, 1);

      if (response.statusCode != null) {
        emit(SearchFailure(errorMessage: response.statusMessage!));
      } else if (response.totalResults == 0) {
        emit(SearchEmpty());
      } else {
        emit(SearchSuccess(movies: response.results!));
      }
    } on SocketException catch (e) {
      emit(SearchFailure(errorMessage: "No internet connection."));
    } on Exception catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}
