part of 'popular_movies_cubit.dart';

@immutable
sealed class PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesSuccess extends PopularMoviesState {
  final List<MovieDetails> movies;

  PopularMoviesSuccess({required this.movies});
}

final class PopularMoviesFailure extends PopularMoviesState {
  final String errorMessage;

  PopularMoviesFailure({required this.errorMessage});
}
