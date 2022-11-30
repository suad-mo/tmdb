import 'package:equatable/equatable.dart';
import '../../../movie/domen/entities/movie_cast_entity.dart';
import '../../../movie/domen/entities/movie_crew_entity.dart';

class PersonMovieCreditsEntity extends Equatable {
  final List<MovieCastEntity>? cast;
  final List<MovieCrewEntity>? crew;

  const PersonMovieCreditsEntity({
    required this.cast,
    required this.crew,
  });

  @override
  List<Object?> get props => [
        cast,
        crew,
      ];
}
