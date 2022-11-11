import 'package:equatable/equatable.dart';

import '../../../../core/enums/movie_genres.dart';

class MovieBaseEntity extends Equatable {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final double? voteAverage;
  final DateTime? releaseDate;
  final List<MovieGenres>? genres;

  const MovieBaseEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
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
      ];
}
