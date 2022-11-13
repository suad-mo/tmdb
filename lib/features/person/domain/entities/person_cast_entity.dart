import 'person_base_entity.dart';

class PersonCastEntity extends PersonBaseEntity {
  final int order;
  final String character;

  const PersonCastEntity({
    required this.character,
    required this.order,
    required super.id,
    required super.name,
    super.profilePath,
  });

  @override
  List<Object?> get props => [
        character,
        order,
        super.id,
        super.name,
        super.profilePath,
      ];
}
