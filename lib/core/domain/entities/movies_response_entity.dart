import 'package:equatable/equatable.dart';
import 'package:tmdb/core/domain/entities/movie_entity.dart';

class MoviesResponseEntity extends Equatable {
  const MoviesResponseEntity({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
  final int page;
  final List<MovieEntity> movies;
  final int totalPages;
  final int totalResults;

  @override
  List<Object?> get props => [
        page,
        movies,
        totalPages,
        totalResults,
      ];
}
