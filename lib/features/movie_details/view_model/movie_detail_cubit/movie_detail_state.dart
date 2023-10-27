part of 'movie_detail_cubit.dart';

@immutable
sealed class MovieDetailState {}

final class MovieDetailLoading extends MovieDetailState {}

final class MovieDetailSuccess extends MovieDetailState {
  final MovieDetails movieDetail;

  MovieDetailSuccess({required this.movieDetail});
}

final class MovieDetailFailure extends MovieDetailState {
  final String errorMessage;

  MovieDetailFailure({required this.errorMessage});
}
