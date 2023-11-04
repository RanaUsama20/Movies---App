import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/models/movie_model/movie_response_model.dart';
import 'package:movies_app/services/api_services.dart';

part 'movie_search_listview_state.dart';

class MovieSearchListviewCubit extends Cubit<MovieSearchListviewCubitState> {
  MovieSearchListviewCubit() : super(MovieSearchListviewCubitInitial()) {}

  bool firstTimeLoading = true;
  int page = 1;

  bool isLoadingMoreData = false;
  bool hasNextPage = true;
  List<MovieDetails> movies = [];
  void populateDataFirstTimeList(List<MovieDetails> firstList) {
    if (firstTimeLoading == true) {
      movies = firstList;
      firstTimeLoading = false;
    }
  }

  void fetchMoreData(String searchQuery) async {
    page += 1;
    if (page > 500 || hasNextPage == false) {
      return;
    }
    if (hasNextPage == true && isLoadingMoreData == false) {
      isLoadingMoreData = true;
      emit(MovieSearchListviewCubitLoadingData());
    }
    try {
      final MovieResponse response =
          await ApiService.getMoviesBySearchQuery(searchQuery, page);
      List<MovieDetails> fetchedData = response.results ?? [];

      if (fetchedData.isNotEmpty) {
        movies.addAll(fetchedData);
        emit(MovieSearchListviewCubitFinishedLoadingData());
      } else {
        hasNextPage = false;
        emit(MovieSearchListviewCubitNoMoreData());
      }
    } catch (e) {
      MovieSearchListviewCubitFaliure(
          errorMessage: "Error loading more movies");
    }

    isLoadingMoreData = false;
  }
}
