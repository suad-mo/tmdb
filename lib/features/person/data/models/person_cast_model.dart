import 'package:tmdb/features/person/domain/entities/person_cast_entity.dart';

class PersonCastModel extends PersonCastEntity {
  final int? gender;
  final String? originalName;
  final String? knownForDepartment;
  final double? popularity;
  final String? creditId;
  final int? castId;
  final bool? adult;

  const PersonCastModel({
    this.gender,
    this.originalName,
    this.knownForDepartment,
    this.popularity,
    this.creditId,
    this.castId,
    this.adult,
    required super.id,
    required super.name,
    super.profilePath,
    required super.character,
    required super.order,
  });

  factory PersonCastModel.fromJson(Map<String, dynamic> json) {
    return PersonCastModel(
      id: (json['id']) as int,
      name: json['name'].toString(),
      profilePath: json['profile_path'].toString(),
      character: json['character'].toString(),
      order: (json['order']) as int,
      gender: (json['gender']) as int?,
      originalName: json['original_name'].toString(),
      knownForDepartment: json['known_for_department'].toString(),
      popularity: json['popularity'] as double?,
      creditId: json['credit_id'].toString(),
      castId: json['cast_id'] as int?,
      adult: json['adult'] as bool?,
    );
  }
}
