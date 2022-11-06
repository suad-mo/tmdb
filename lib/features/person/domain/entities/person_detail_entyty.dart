import 'package:tmdb/features/person/domain/entities/person_base_entity.dart';

class PersonDetailEntity extends PersonBaseEntity {
  // int? id; //
  // String? name; //
  // String? profilePath; //

  final String? knownForDepartment; //
  //Age
  final DateTime? birthday;
  final DateTime? deathday;
  final String? biography;
  final String? placeOfBirth;
  final List<String>? alsoKnownAs;
  final double? popularity; //

  // MovieCredits? movieCredits;
  // Images? images;

  const PersonDetailEntity({
    required int id,
    required String name,
    String? profilePath,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.knownForDepartment,
    this.placeOfBirth,
    this.popularity,
  }) : super(id: id, name: name, profilePath: profilePath);
}
