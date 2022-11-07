import 'package:tmdb/features/person/domain/entities/person_base_entity.dart';

import '../../../../core/domain/entities/image_entity.dart';

class PersonDetailEntity extends PersonBaseEntity {
  final String? knownForDepartment; //
  //Age make get propertis
  final DateTime? birthday;
  final DateTime? deathday;
  final String? biography;
  final String? placeOfBirth;
  final List<String>? alsoKnownAs;
  final double? popularity; //
  final List<ImageEntity>? imgProfiles;

  int? get age => deathday != null ? 1 : 2;

  // MovieCredits? movieCredits;
  // Images? images;

  const PersonDetailEntity({
    required int id,
    required String name,
    String? profilePath,
    this.knownForDepartment,
    this.biography,
    this.birthday,
    this.deathday,
    this.placeOfBirth,
    this.alsoKnownAs,
    this.popularity,
    this.imgProfiles,
  }) : super(
          id: id,
          name: name,
          profilePath: profilePath,
        );
}
