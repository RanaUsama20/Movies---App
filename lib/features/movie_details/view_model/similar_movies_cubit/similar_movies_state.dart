part of 'similar_movies_cubit.dart';

@immutable
sealed class SimilarMoviesState {}

final class SimilarMoviesLoading extends SimilarMoviesState {}

final class SimilarMoviesSucces extends SimilarMoviesState {
  final List<MovieDetails> movies;

  SimilarMoviesSucces({required this.movies});
}

final class SimilarMoviesFailure extends SimilarMoviesState {
  final String errorMessage;

  SimilarMoviesFailure({required this.errorMessage});
}
