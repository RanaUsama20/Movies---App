part of 'watchlist_cubit.dart';

@immutable
sealed class WatchlistState {}

final class WatchlistInitilal extends WatchlistState {}

final class Watchlisted extends WatchlistState {}

final class NotWatchlisted extends WatchlistState {}
