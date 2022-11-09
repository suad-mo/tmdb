import 'package:tmdb/features/person/domain/entities/person_base_entity.dart';

import '../../../../core/domain/entities/image_entity.dart';

class PersonDetailEntity extends PersonBaseEntity {
  final String? knownForDepartment;
  final DateTime? birthday;
  final DateTime? deathday;
  final String? biography;
  final String? placeOfBirth;
  final List<String>? alsoKnownAs;
  final double? popularity;
  final List<ImageEntity>? imgProfiles;

  int? get age {
    return birthday != null
        ? deathday != null
            ? deathday!.difference(birthday!).inDays ~/ 365.25
            : DateTime.now().difference(birthday!).inDays ~/ 365.25
        : null;
    // if (deathday != null) {
    //   if (birthday != null) {
    //     return deathday!.difference(birthday!).inDays ~/ 365.6;
    //   }
    //   return null;
    // } else {
    //   if (birthday != null) {
    //     return DateTime.now().difference(birthday!).inDays ~/ 365.6;
    //   }
    //   return null;
    // }
  }

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
