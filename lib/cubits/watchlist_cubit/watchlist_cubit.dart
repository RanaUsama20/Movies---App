import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit() : super(WatchlistInitilal());
  List<int> moveiIds = [];

  void toggleWatchList(int movieId) {
    if (moveiIds.contains(movieId)) {
      moveiIds.remove(movieId);
      emit(NotWatchlisted());
    } else {
      moveiIds.add(movieId);
      emit(Watchlisted());
    }
  }
}
