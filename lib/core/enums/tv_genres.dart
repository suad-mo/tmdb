enum TvGenres {
  action(id: 10759, name: "Action & Adventure"),
  animation(id: 16, name: "Animation"),
  comedy(id: 35, name: "Comedy"),
  crime(id: 80, name: "Crime"),
  documentary(id: 99, name: "Documentary"),
  drama(id: 18, name: "Drama"),
  family(id: 10751, name: "Family"),
  kids(id: 10762, name: "Kids"),
  mystery(id: 9648, name: "Mystery"),
  news(id: 10763, name: "News"),
  reality(id: 10764, name: "Reality"),
  sff(id: 10765, name: "Sci-Fi & Fantasy"),
  soap(id: 10766, name: "Soap"),
  talk(id: 10767, name: "Talk"),
  war(id: 10768, name: "War & Politics"),
  western(id: 37, name: "Western"),
  xyz(id: -1, name: 'Null Tv Genres');

  const TvGenres({required this.id, required this.name});
  final int id;
  final String name;

  static TvGenres getWithId(int id) => TvGenres.values.firstWhere(
        (el) => el.id == id,
        orElse: () => TvGenres.xyz,
      );

  Map<String, String> get pathMap =>
      id < 0 ? <String, String>{'with_genres': '$id'} : {};
}
