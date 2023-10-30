class GenreDM {
  final int id;
  final String genreTitle;

  GenreDM({required this.id, required this.genreTitle});

  static List<GenreDM> getGenres() {
    return [
      GenreDM(id: 28, genreTitle: "Action"),
      GenreDM(id: 12, genreTitle: "Adventure"),
      GenreDM(id: 16, genreTitle: "Animation"),
      GenreDM(id: 35, genreTitle: "Comedy"),
      GenreDM(id: 80, genreTitle: "Crime"),
      GenreDM(id: 99, genreTitle: "Documentary"),
      GenreDM(id: 18, genreTitle: "Drama"),
      GenreDM(id: 10751, genreTitle: "Family"),
      GenreDM(id: 14, genreTitle: "Fantasy"),
      GenreDM(id: 36, genreTitle: "History"),
      GenreDM(id: 27, genreTitle: "Horror"),
      GenreDM(id: 10402, genreTitle: "Music"),
      GenreDM(id: 9648, genreTitle: "Mystery"),
      GenreDM(id: 10749, genreTitle: "Romance"),
      GenreDM(id: 878, genreTitle: "Science Fiction"),
      GenreDM(id: 10770, genreTitle: "TV Movie"),
      GenreDM(id: 53, genreTitle: "Thriller"),
      GenreDM(id: 10752, genreTitle: "War"),
      GenreDM(id: 37, genreTitle: "Western"),
    ];
  }
}
