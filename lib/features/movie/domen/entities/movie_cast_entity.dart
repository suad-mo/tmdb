import 'movie_base_entity.dart';

class MovieCastEntity extends MovieBaseEntity {
  final String? creditId;
  final String? character;
  final int? order;
  final double? popularity;

  const MovieCastEntity({
    required this.creditId,
    required this.character,
    required this.order,
    required this.popularity,
    required super.id,
    required super.title,
    super.posterPath,
    super.backdropPath,
    super.voteAverage,
    super.releaseDate,
    super.genres,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        backdropPath,
        voteAverage,
        releaseDate,
        genres,
        creditId,
        character,
        order,
      ];
}
