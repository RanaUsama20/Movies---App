part of 'movie_search_listview_cubit.dart';

@immutable
sealed class MovieSearchListviewCubitState {}

final class MovieSearchListviewCubitInitial
    extends MovieSearchListviewCubitState {}

final class MovieSearchListviewCubitLoadingData
    extends MovieSearchListviewCubitState {}

final class MovieSearchListviewCubitFinishedLoadingData
    extends MovieSearchListviewCubitState {}

final class MovieSearchListviewCubitNoMoreData
    extends MovieSearchListviewCubitState {}

final class MovieSearchListviewCubitFaliure
    extends MovieSearchListviewCubitState {
  final String errorMessage;

  MovieSearchListviewCubitFaliure({required this.errorMessage});
}
