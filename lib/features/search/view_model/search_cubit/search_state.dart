part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchEmpty extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<MovieDetails> movies;

  SearchSuccess({required this.movies});
}

final class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure({required this.errorMessage});
}
