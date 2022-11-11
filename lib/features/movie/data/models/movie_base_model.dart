import 'package:tmdb/core/enums/movie_genres.dart';

import '../../domen/entities/movie_base_entity.dart';

class MovieBaseModel extends MovieBaseEntity {
  final bool? adult;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final bool? video;
  final int? voteCount;

  final String mediaType = 'movie';

  MovieBaseModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.backdropPath,
    required super.releaseDate,
    required super.voteAverage,
    required this.adult,
    required List<int>? genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.video,
    required this.voteCount,
  }) : super(
          // ignore: prefer_null_aware_operators
          genres: genreIds != null
              ? genreIds.map((genre) => MovieGenres.getWithId(id)).toList()
              : null,
        );

  factory MovieBaseModel.fromJson(Map<String, dynamic> json) => MovieBaseModel(
        id: num.parse(json["id"] ?? '-1').toInt(),
        title: json["title"] ?? 'title',
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        adult: json["adult"],
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(
                json["genre_ids"].map((x) => num.tryParse(x ?? '-1') as int)),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: num.tryParse(json["popularity"] ?? 'null') as double?,
        releaseDate: DateTime.tryParse(json["release_date"] ?? 'null'),
        video: json["video"] as bool?,
        voteAverage: num.tryParse(json["vote_average"] ?? 'null') as double?,
        voteCount: num.tryParse(json["vote_count"] ?? 'null') as int,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
        "adult": adult,
        "genre_ids": genres == null ? null : genres!.map((e) => e.id).toList(),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
