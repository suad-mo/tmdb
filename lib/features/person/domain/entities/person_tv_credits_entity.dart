import 'package:equatable/equatable.dart';

import '../../../tv/domen/entities/tv_cast_entity.dart';

class PersonTvCreditsEntity extends Equatable {
  final List<TvCastEntity>? cast;
  // final List<MovieCrewEntity>? crew;

  const PersonTvCreditsEntity({
    required this.cast,
    // required this.crew,
  });

  @override
  List<Object?> get props => [
        cast,
        // crew,
      ];
}
