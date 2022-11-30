import 'package:equatable/equatable.dart';

import '../../../../core/enums/tv_genres.dart';

class TvBaseEntity extends Equatable {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;
  final double? voteAverage;
  final DateTime? firstAirDate;
  final List<TvGenres>? genres;

  const TvBaseEntity({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.firstAirDate,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        posterPath,
        backdropPath,
        voteAverage,
        firstAirDate,
        genres,
      ];
}
