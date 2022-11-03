enum MovieGenres {
  action(id: 28, name: 'Action'),
  adventure(id: 12, name: "Adventure"),
  animation(id: 16, name: "Animation"),
  comedy(id: 35, name: "Comedy"),
  crime(id: 80, name: "Crime"),
  documentary(id: 99, name: "Documentary"),
  drama(id: 18, name: "Drama"),
  family(id: 10751, name: "Family"),
  fantasy(id: 14, name: "Fantasy"),
  history(id: 36, name: "History"),
  horror(id: 27, name: "Horror"),
  music(id: 10402, name: "Music"),
  mystery(id: 9648, name: "Mystery"),
  romance(id: 10749, name: "Romance"),
  sienceFiction(id: 878, name: "Science Fiction"),
  tvMovie(id: 10770, name: "TV Movie"),
  thriller(id: 53, name: "Thriller"),
  war(id: 10752, name: "War"),
  western(id: 37, name: "Western");

  const MovieGenres({required this.id, required this.name});
  final int id;
  final String name;

  static MovieGenres getWithId(int id) =>
      MovieGenres.values.firstWhere((el) => el.id == id);

  Map<String, String> get pathMap => <String, String>{'with_genres': '$id'};
}
