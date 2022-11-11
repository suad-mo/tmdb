// To parse this JSON data, do
//
//     final movieCastModel = movieCastModelFromMap(jsonString);

import 'dart:convert';

class MovieCastModel {
  MovieCastModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.character,
    required this.creditId,
    required this.order,
  });

  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final List<int>? genreIds;
  final bool? adult;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final DateTime? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  final String mediaType = 'movie';

  final String? creditId;
  final String? character;
  final int? order;

  // final bool adult;
  // final String backdropPath;
  // final int id;
  // final String title;
  // final String originalLanguage;
  // final String originalTitle;
  // final String overview;
  // final String posterPath;
  // final List<int> genreIds;
  // final double popularity;
  // final DateTime releaseDate;
  // final bool video;
  // final double voteAverage;
  // final int voteCount;

  // final bool adult;
  // final String backdropPath;
  // final List<int> genreIds;
  // final int id;
  // final String originalLanguage;
  // final String originalTitle;
  // final String overview;
  // final double popularity;
  // final String posterPath;
  // final DateTime releaseDate;
  // final String title;
  // final bool video;
  // final double voteAverage;
  // final int voteCount;
  // final String creditId;
  // MOVE_CREW_MODEL
  // final String department;
  // final String job;

  factory MovieCastModel.fromJson(String str) =>
      MovieCastModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieCastModel.fromMap(Map<String, dynamic> json) => MovieCastModel(
        id: json["id"],
        title: json["title"] ?? 'title',
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        adult: json["adult"],
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(
                json["genre_ids"].map((x) => num.tryParse(x ?? '0') as int)),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: num.tryParse(json["popularity"] ?? 'null') as double?,
        releaseDate: DateTime.tryParse(json["release_date"] ??
            'null'), // json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        video: json["video"] as bool?,
        voteAverage: num.tryParse(json["vote_average"] ?? 'null')
            as double?, // == null ? null : json["vote_average"].toDouble(),
        voteCount: num.tryParse(json["vote_count"] ?? 'null')
            as int, // == null ? null : json["vote_count"],
        character: json["character"],
        creditId: json["credit_id"],
        order: num.tryParse(json["order"] ?? 'null') as int,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
        "adult": adult,
        "genre_ids": genreIds == null
            ? null
            : List<int>.from(genreIds!), //(genreIds.map((e) => e.toString())),
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
        "character": character,
        "credit_id": creditId,
        "order": order,
      };
}

class MovieCrewModel {
  MovieCrewModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.creditId,
    required this.department,
    required this.job,
  });

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String creditId;
  final String department;
  final String job;
}

class MovieBaseModel {
  MovieBaseModel({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final List<int> genreIds;
  final double popularity;
  final DateTime releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;
}
