import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit() : super(WatchlistInitilal());
  Box moviesBox = Hive.box<MovieDetails>("moviesBox");

  List<MovieDetails> movies = [];
  void populateList() {
    movies = moviesBox.values.map((movie) => movie as MovieDetails).toList();
  }

  void toggleWatchList(int movieId, MovieDetails movieDetails) async {
    if (moviesBox.keys.contains(movieId)) {
      await removeItemFromDataBase(movieId);

      emit(NotWatchlisted());
    } else {
      await addItemToDataBase(movieId, movieDetails);

      emit(Watchlisted());
    }
  }

  Future<void> addItemToDataBase(int movieId, MovieDetails movieDetails) async {
    await moviesBox.put(movieId, movieDetails);
    populateList();
    print("Added");
  }

  Future<void> removeItemFromDataBase(int movieId) async {
    await moviesBox.delete(movieId);
    populateList();
  }
}
