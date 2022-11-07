import 'person_base_entity.dart';

class PersonCastEntity extends PersonBaseEntity {
  final int order;
  final String character;

  const PersonCastEntity({
    required int id,
    required String name,
    String? profilePath,
    required this.character,
    required this.order,
  }) : super(
          id: id,
          name: name,
          profilePath: profilePath,
        );

  @override
  List<Object?> get props => [
        character,
        order,
        super.id,
        super.name,
        super.profilePath,
      ];
}
