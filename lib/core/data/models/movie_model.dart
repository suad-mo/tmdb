import 'package:dartz/dartz.dart';
import 'package:tmdb/core/domain/entities/movie_entity.dart';

const Map<int, String> genresMovie = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Science Fiction",
  10770: "TV Movie",
  53: "Thriller",
  10752: "War",
  37: "Western",
};

class MovieModel extends MovieEntity {
  late final bool adult;
  late final String backdropPath;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final String mediaType;
  late final List<int> genreIds;
  late final double popularity;
  late final bool video;
  late final int voteCount;

  MovieModel({
    required int id,
    required String title,
    required String posterPath,
    required String releaseDate,
    required double? voteAverage,
    required this.backdropPath,
    required this.adult,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.video,
    required this.voteCount,
  }) : super(
            id: id,
            title: title,
            posterPath: posterPath,
            voteAverage: voteAverage ?? 0,
            releaseDate: releaseDate,
            genres: genreIds
                .map((genre) => genresMovie[genre] ?? 'No name genre')
                .toList());

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final id = int.tryParse(json['id']) ?? 0;
    print(id.toString());
    final title = json['title'].toString();
    final posterPath = json['poster_path'].toString();
    final releaseDate = json['release_date'].toString();
    final voteAverage = double.tryParse(json['vote_average']) ?? 0.0;
    final adult = json['adult'] as bool;
    final backdropPath = json['backdrop_path'].toString();
    final originalTitle = json['original_title'].toString();
    final overview = json['overview'].toString();
    final originalLanguage = json['original_language'].toString();
    final mediaType = json['media_type'].toString();
    final genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    final popularity = double.tryParse(json['popularity']) ?? 0.0;
    final video = json['video'] as bool;
    final voteCount = int.tryParse(json['vote_count']) ?? 0;
    return MovieModel(
      id: id,
      title: title,
      posterPath: posterPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      backdropPath: backdropPath,
      adult: adult,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      mediaType: mediaType,
      genreIds: genreIds,
      popularity: popularity,
      video: video,
      voteCount: voteCount,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
