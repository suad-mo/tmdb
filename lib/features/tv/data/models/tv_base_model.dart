import 'dart:convert';

import 'package:tmdb/core/enums/tv_genres.dart';

import '../../domen/entities/tv_base_entity.dart';

class TvBaseModel extends TvBaseEntity {
  final bool? adult;
  final String? originalName;
  final String? originalLanguage;
  final List<String>? originCountry;
  final double? popularity;
  final String? overview;
  final int? voteCount;

  final String mediaType = 'tv';
  TvBaseModel({
    required super.id,
    required super.name,
    required super.posterPath,
    required super.backdropPath,
    required super.firstAirDate,
    required super.voteAverage,
    List<int>? genreIds,
    required this.adult,
    required this.originalName,
    required this.originalLanguage,
    required this.originCountry,
    required this.overview,
    required this.popularity,
    required this.voteCount,
  }) : super(
          // ignore: prefer_null_aware_operators
          genres: genreIds != null
              ? genreIds.map((genre) => TvGenres.getWithId(id)).toList()
              : null,
        );

  factory TvBaseModel.fromRawJson(String str) =>
      TvBaseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TvBaseModel.fromJson(Map<String, dynamic> json) => TvBaseModel(
        id: json["id"] == null ? -1 : num.parse(json["id"].toString()).toInt(),
        name: json["name"] ?? 'name',
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        adult: json["adult"],
        firstAirDate: json["first_air_date"] == null ||
                json["first_air_date"].toString().isEmpty
            ? null
            : DateTime.tryParse(json["first_air_date"].toString()),
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(json["genre_ids"]
                .map((x) => num.tryParse(x.toString()) as int)),
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: num.tryParse(json["popularity"].toString()) as double?,
        voteAverage: num.tryParse(json["vote_average"].toString()) as double?,
        voteCount: num.tryParse(json["vote_count"].toString()) as int,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
        "adult": adult,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate?.year.toString().padLeft(4, '0')}-${firstAirDate?.month.toString().padLeft(2, '0')}-${firstAirDate?.day.toString().padLeft(2, '0')}",
        "genre_ids": genres == null ? null : genres!.map((e) => e.id).toList(),
        "origin_country": originCountry == null || originCountry!.isEmpty
            ? null
            : List<String>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
