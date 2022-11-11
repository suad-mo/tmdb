import 'movie_base_entity.dart';

class MovieCastEntity {
  final String? creditId;
  final String? character;
  final int? order;
  final MovieBaseEntity baseEntity;

  MovieCastEntity({
    required this.creditId,
    required this.character,
    required this.order,
    required this.baseEntity,
  });
}
