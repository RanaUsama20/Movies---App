 class GenreDM {
  final int id;
  final String genreTitle;
  final String imagePath;

  GenreDM({required this.id, required this.genreTitle, required this.imagePath});

  static List<GenreDM> getGenres() {
    return [
      GenreDM(id: 28, genreTitle: "Action",imagePath: 'assets/images/action.jpeg'),
      GenreDM(id: 12, genreTitle: "Adventure",imagePath: 'assets/images/adventure.jpg'),
      GenreDM(id: 16, genreTitle: "Animation",imagePath: 'assets/images/animation.jpeg'),
      GenreDM(id: 35, genreTitle: "Comedy",imagePath: 'assets/images/comedy.jpg'),
      GenreDM(id: 80, genreTitle: "Crime",imagePath: 'assets/images/crime.jpg'),
      GenreDM(id: 99, genreTitle: "Documentary",imagePath: 'assets/images/documentary.jpg'),
      GenreDM(id: 18, genreTitle: "Drama",imagePath: 'assets/images/drama.jpg'),
      GenreDM(id: 10751, genreTitle: "Family",imagePath: 'assets/images/family.jpg'),
      GenreDM(id: 14, genreTitle: "Fantasy",imagePath: 'assets/images/fantasy.jpeg'),
      GenreDM(id: 36, genreTitle: "History",imagePath: 'assets/images/history.jpg'),
      GenreDM(id: 27, genreTitle: "Horror",imagePath: 'assets/images/horror.jpg'),
      GenreDM(id: 10402, genreTitle: "Music",imagePath: 'assets/images/music.jpg'),
      GenreDM(id: 9648, genreTitle: "Mystery",imagePath: 'assets/images/mystery.jpg'),
      GenreDM(id: 10749, genreTitle: "Romance",imagePath: 'assets/images/romance.jpeg'),
      GenreDM(id: 878, genreTitle: "Science Fiction",imagePath: 'assets/images/science fiction.jpg'),
      GenreDM(id: 10770, genreTitle: "TV Movie",imagePath: 'assets/images/Tv movies.jpg'),
      GenreDM(id: 53, genreTitle: "Thriller",imagePath: 'assets/images/thriller.png'),
      GenreDM(id: 10752, genreTitle: "War",imagePath: 'assets/images/war.jpg'),
      GenreDM(id: 37, genreTitle: "Western",imagePath: 'assets/images/western.jpg'),
    ];
  }
}
