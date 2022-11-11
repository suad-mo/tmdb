import 'package:tmdb/features/movie/domen/entities/movie_base_entity.dart';

class MovieCrewEntity extends MovieBaseEntity {
  final String? creditId;
  final String? department;
  final String? job;

  MovieCrewEntity({
    required this.creditId,
    required this.department,
    required this.job,
    required MovieBaseEntity baseEntity,
  }) : super(
          id: baseEntity.id,
          title: baseEntity.title,
          posterPath: baseEntity.posterPath,
          backdropPath: baseEntity.backdropPath,
          voteAverage: baseEntity.voteAverage,
          releaseDate: baseEntity.releaseDate,
          genres: baseEntity.genres,
        );
}
