import '../../../../core/data/models/image_model.dart';
import '../../domain/entities/person_detail_entyty.dart';

class PersonDetailModel extends PersonDetailEntity {
  const PersonDetailModel({
    required int id,
    required String name,
    String? profilePath,
    required this.imageProfileModels,
    required super.knownForDepartment,
    required super.biography,
    required super.birthday,
    required super.deathday,
    required super.placeOfBirth,
    required super.alsoKnownAs,
    required super.popularity,
    required this.adult,
    required this.gender,
    required this.homepage,
    required this.imdbId,
    // this.movieCredits,
  }) : super(
          id: id,
          name: name,
          profilePath: profilePath,
          imgProfiles: imageProfileModels,
        );

  final List<ImageModel> imageProfileModels;
  final bool? adult;
  final int? gender;
  final String? homepage;
  final String? imdbId;

  factory PersonDetailModel.fromJson(Map<String, dynamic> json) =>
      PersonDetailModel(
        id: (json["id"] as num).toInt(),
        name: json["name"].toString(),
        profilePath: json["profile_path"] as String?,
        adult: json["adult"] as bool?,
        alsoKnownAs: json["also_known_as"] == null
            ? null
            : List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"] as String?,
        birthday: json["birthday"] == null
            ? null
            : DateTime.tryParse(json["birthday"]),
        deathday: json["deathday"] == null
            ? null
            : DateTime.tryParse(json["deathday"]),
        gender: json["gender"] as int?,
        homepage: json["homepage"] as String?,
        imdbId: json["imdb_id"] as String?,
        knownForDepartment: json["known_for_department"] as String?,
        placeOfBirth: json["place_of_birth"] as String?,
        popularity: ((json['popularity']) as num).toDouble(),
        // popularity: double.tryParse(json["popularity"]), //
        imageProfileModels: List<ImageModel>.from(
            json["images"]['profiles'].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'also_known_as': alsoKnownAs == null
            ? null
            : List<dynamic>.from(alsoKnownAs!.map((x) => x)),
        'biography': biography,
        'birthday': birthday == null
            ? null
            : "${birthday?.year.toString().padLeft(4, '0')}-${birthday?.month.toString().padLeft(2, '0')}-${birthday?.day.toString().padLeft(2, '0')}",
        'deathday': deathday == null
            ? null
            : '${deathday?.year.toString().padLeft(4, '0')}-${deathday?.month.toString().padLeft(2, '0')}-${deathday?.day.toString().padLeft(2, '0')}',
        'gender': gender,
        'homepage': homepage,
        "id": id,
        "imdb_id": imdbId,
        "known_for_department": knownForDepartment,
        "name": name,
        "place_of_birth": placeOfBirth,
        "popularity": popularity,
        "profile_path": profilePath,
        "images": {
          'profiles': List.from(imageProfileModels.map((e) => e.toJson())),
        }
        // "movie_credits": movieCredits == null ? null : movieCredits.toMap(),
      };
}
