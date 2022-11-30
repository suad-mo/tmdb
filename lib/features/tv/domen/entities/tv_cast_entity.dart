import 'tv_base_entity.dart';

class TvCastEntity extends TvBaseEntity {
  final String? creditId;
  final String? character;
  final int? episodeCount;
  final double? popularity;

  const TvCastEntity({
    this.creditId,
    this.character,
    this.episodeCount,
    this.popularity,
    required super.id,
    required super.name,
    super.posterPath,
    super.backdropPath,
    super.voteAverage,
    super.firstAirDate,
    super.genres,
  });
}
