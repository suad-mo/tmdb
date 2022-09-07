import '../data/genres.dart';
import '../configuration.dart';

class ItemMedia {
  ItemMedia({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.genres,
    required this.voteAverage,
    required this.isOK,
  });

  final num id;
  final String title;
  final String posterPath;
  final num voteAverage;
  final List<String> genres;
  final bool isOK;

  factory ItemMedia.fromJson(Map<String, dynamic> data) {
    try {
      final num id = data['id'];
      String title;
      List<String> genres = [];
      if (data.containsKey('title')) {
        title = data['title'];
        final genreIds = data['genre_ids'];
        genresMovie.forEach((key, value) {
          if (genreIds.contains(key)) {
            genres.add(value);
          }
        });
      } else {
        title = data['name'];
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
        isOK: true,
      );
    } catch (e) {
      return ItemMedia(
        id: 0,
        title: '',
        posterPath: '',
        genres: [],
        voteAverage: 0,
        isOK: false,
      );
    }
  }
}
