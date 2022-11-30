import '../../domen/entities/tv_cast_entity.dart';
import '../../../../core/enums/tv_genres.dart';

class TvCastModel extends TvCastEntity {
  const TvCastModel({
    super.creditId,
    super.character,
    super.episodeCount,
    super.popularity,
    required super.id,
    required super.name,
    super.posterPath,
    super.backdropPath,
    super.voteAverage,
    super.firstAirDate,
    super.genres,
  });

  factory TvCastModel.fromJson(Map<String, dynamic> json) => TvCastModel(
        id: num.parse(json["id"].toString()).toInt(),
        name: json["name"] ?? 'name',
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        voteAverage: num.tryParse(json["vote_average"].toString()) as double?,
        popularity: num.tryParse(json["popularity"].toString()) as double?,
        firstAirDate: json["first_air_date"] == null ||
                json["first_air_date"].toString().isEmpty
            ? null
            : DateTime.tryParse(json["first_air_date"].toString()),
        character: json["character"],
        creditId: json["credit_id"],
        episodeCount: num.tryParse(json["episode_count"].toString()) as int?,
        genres: json["genre_ids"] == null
            ? null
            : List<TvGenres>.from(
                json["genre_ids"].map((x) {
                  final id = (num.tryParse(x.toString()) as int);
                  return TvGenres.getWithId(id);
                }),
              ),
      );

  Map<String, dynamic> toJson() => {
        "character": character,
        "credit_id": creditId,
        "episode_count": episodeCount,
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
        "genre_ids": genres == null ? null : genres!.map((e) => e.id).toList(),
        "first_air_date": firstAirDate == null
            ? null
            : """${firstAirDate!.year.toString().padLeft(4, '0')}
            -${firstAirDate!.month.toString().padLeft(2, '0')}
            -${firstAirDate!.day.toString().padLeft(2, '0')}""",
        "vote_average": voteAverage,
        "popularity": popularity,
      };
}


// final bool? adult;
  // final List<String>? originCountry;
  // final String? originalLanguage;
  // final String? originalName;
  // final String? overview;
  // final int? voteCount;
  // this.adult,
    // this.originCountry,
    // this.originalLanguage,
    // this.originalName,
    // this.overview,
    // this.voteCount,