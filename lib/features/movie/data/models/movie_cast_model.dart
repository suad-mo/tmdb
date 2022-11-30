import '../../../../core/enums/movie_genres.dart';
import '../../domen/entities/movie_cast_entity.dart';

class MovieCastModel extends MovieCastEntity {
  const MovieCastModel({
    super.creditId,
    super.character,
    super.order,
    super.popularity,
    required super.id,
    required super.title,
    super.posterPath,
    super.backdropPath,
    super.voteAverage,
    super.releaseDate,
    super.genres,
  });

  factory MovieCastModel.fromJson(Map<String, dynamic> json) => MovieCastModel(
        creditId: json['credit_id'],
        character: json['character'],
        order: num.parse(json['order'].toString()).toInt(),
        id: num.parse(json["id"].toString()).toInt(),
        title: json["title"] ?? 'title',
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        voteAverage: num.tryParse(json["vote_average"].toString()) as double?,
        popularity: num.tryParse(json["popularity"].toString()) as double?,
        releaseDate: json["release_date"] == null ||
                json["release_date"].toString().isEmpty
            ? null
            : DateTime.tryParse(json["release_date"].toString()),
        //DateTime.tryParse(json["release_date"].toString()),
        genres: json["genre_ids"] == null
            ? null
            : List<MovieGenres>.from(
                json["genre_ids"].map((x) {
                  final id = (num.tryParse(x.toString()) as int);
                  return MovieGenres.getWithId(id);
                }),
              ),
      );

  Map<String, dynamic> toJson() => {
        'character': character,
        'credit_id': creditId,
        'order': order,
        "id": id,
        "title": title,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
        "genre_ids": genres == null ? null : genres!.map((e) => e.id).toList(),
        "release_date": releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
        "popularity": popularity,
      };
}
