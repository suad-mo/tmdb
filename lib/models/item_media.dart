import '../data/genres.dart';
import '../configuration.dart';

class ItemMedia {
  ItemMedia({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.genres,
    required this.voteAverage,
    required this.releaseDate,
    required this.isOK,
  });

  final num id;
  final String title;
  final String posterPath;
  final num voteAverage;
  final List<String> genres;
  final String releaseDate;
  final bool isOK;

  factory ItemMedia.fromJson(Map<String, dynamic> data) {
    try {
      final num id = data['id'];
      String title;
      List<String> genres = [];
      String releaseDate;
      if (data.containsKey('title')) {
        title = data['title'];
        releaseDate = data['release_date'];
        final genreIds = data['genre_ids'];
        genresMovie.forEach((key, value) {
          if (genreIds.contains(key)) {
            genres.add(value);
          }
        });
      } else {
        title = data['name'];
        releaseDate = data['first_air_date'];
        final genreIds = data['genre_ids'];
        genresTv.forEach((key, value) {
          if (genreIds.contains(key)) {
            genres.add(value);
          }
        });
      }
      final posterPath = TMDB.https + data['poster_path'];
      final num voteAverage = data['vote_average'];
      return ItemMedia(
        id: id,
        title: title,
        posterPath: posterPath,
        genres: genres,
        voteAverage: voteAverage,
        releaseDate: releaseDate,
        isOK: true,
      );
    } catch (e) {
      return ItemMedia(
        id: 0,
        title: '',
        posterPath: '',
        genres: [],
        voteAverage: 0,
        releaseDate: '',
        isOK: false,
      );
    }
  }
}
