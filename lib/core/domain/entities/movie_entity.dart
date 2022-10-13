import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final List<String> genres;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        voteAverage,
        releaseDate,
        genres,
      ];
}
