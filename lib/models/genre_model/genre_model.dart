 class GenreDM {
  final int id;
  final String genreTitle;
  final String imagePath;

  GenreDM({required this.id, required this.genreTitle, required this.imagePath});

  static List<GenreDM> getGenres() {
    return [
      GenreDM(id: 28, genreTitle: "Action",imagePath: ''),
      GenreDM(id: 12, genreTitle: "Adventure",imagePath: ''),
      GenreDM(id: 16, genreTitle: "Animation",imagePath: ''),
      GenreDM(id: 35, genreTitle: "Comedy",imagePath: ''),
      GenreDM(id: 80, genreTitle: "Crime",imagePath: ''),
      GenreDM(id: 99, genreTitle: "Documentary",imagePath: ''),
      GenreDM(id: 18, genreTitle: "Drama",imagePath: ''),
      GenreDM(id: 10751, genreTitle: "Family",imagePath: ''),
      GenreDM(id: 14, genreTitle: "Fantasy",imagePath: ''),
      GenreDM(id: 36, genreTitle: "History",imagePath: ''),
      GenreDM(id: 27, genreTitle: "Horror",imagePath: ''),
      GenreDM(id: 10402, genreTitle: "Music",imagePath: ''),
      GenreDM(id: 9648, genreTitle: "Mystery",imagePath: ''),
      GenreDM(id: 10749, genreTitle: "Romance",imagePath: ''),
      GenreDM(id: 878, genreTitle: "Science Fiction",imagePath: ''),
      GenreDM(id: 10770, genreTitle: "TV Movie",imagePath: ''),
      GenreDM(id: 53, genreTitle: "Thriller",imagePath: ''),
      GenreDM(id: 10752, genreTitle: "War",imagePath: ''),
      GenreDM(id: 37, genreTitle: "Western",imagePath: ''),
    ];
  }
}
