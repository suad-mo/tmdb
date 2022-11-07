// import 'dart:convert';

// import 'package:tmdb/core/data/models/image_model.dart';
// import 'package:tmdb/features/person/domain/entities/person_detail_entyty.dart';

// class PersonDetailModel extends PersonDetailEntity {
//   const PersonDetailModel({
//     required int id,
//     required String name,
//     String? profilePath,
//     required List<ImageModel> imageProfileModels,
//     required super.knownForDepartment,
//     required super.biography,
//     required super.birthday,
//     required super.deathday,
//     required super.placeOfBirth,
//     required super.alsoKnownAs,
//     required super.popularity,
//     required this.adult,
//     required this.gender,
//     required this.homepage,
//     required this.imdbId,
//     // this.movieCredits,
//   }) : super(
//           id: id,
//           name: name,
//           profilePath: profilePath,
//           imgProfiles: imageProfileModels
//         );
  
//   final bool? adult;
//   final int? gender;
//   final String? homepage;
//   final String? imdbId;
//   // final int id;
//   // final String name;
//   // final String profilePath;

//   // final String knownForDepartment;
//   // final DateTime birthday;
//   // final dynamic deathday;
//   // final String placeOfBirth;
//   // final List<String> alsoKnownAs;
//   // final double popularity;
//   // final String biography;
//   // final Images images;
//   // final MovieCredits movieCredits;

//   factory PersonDetailModel.fromJson(String str) =>
//       PersonDetailModel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory PersonDetailModel.fromMap(Map<String, dynamic> json) =>
//       PersonDetailModel(
//         id: json["id"] as int,
//         name: json["name"].toString(), 
//         profilePath: json["profile_path"] as String?,
//         adult: json["adult"] as bool?,
//         alsoKnownAs: json["also_known_as"] == null
//             ? null
//             : List<String>.from(json["also_known_as"].map((x) => x)),
//         biography:
//             json["biography"] as String?,
//         birthday: json["birthday"] == null
//             ? null
//             : DateTime.tryParse(json["birthday"]), 
//         deathday: json["deathday"] == null
//             ? null
//             : DateTime.tryParse(json["deathday"]),
//         gender: json["gender"] as int?,
//         homepage:
//             json["homepage"] as String?, //, == null ? null : json["homepage"],
//         imdbId: json["imdb_id"] as String?,
//         knownForDepartment: json["known_for_department"] as String?,
//         placeOfBirth: json["place_of_birth"] as String?,
//         popularity: json["popularity"] as double?,
//         imageProfileModels: json["images"]['profiles'] == null ? null : ImageModel.fromJson(json["images"]['profiles']),
//         // movieCredits: json["movie_credits"] == null ? null : MovieCredits.fromMap(json["movie_credits"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "adult": adult == null ? null : adult,
//         "also_known_as": alsoKnownAs == null
//             ? null
//             : List<dynamic>.from(alsoKnownAs.map((x) => x)),
//         "biography": biography == null ? null : biography,
//         "birthday": birthday == null
//             ? null
//             : "${birthday?.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
//         "deathday": deathday,
//         "gender": gender == null ? null : gender,
//         "homepage": homepage == null ? null : homepage,
//         "id": id == null ? null : id,
//         "imdb_id": imdbId == null ? null : imdbId,
//         "known_for_department":
//             knownForDepartment == null ? null : knownForDepartment,
//         "name": name == null ? null : name,
//         "place_of_birth": placeOfBirth == null ? null : placeOfBirth,
//         "popularity": popularity == null ? null : popularity,
//         "profile_path": profilePath == null ? null : profilePath,
//         // "images": images == null ? null : images.toMap(),
//         // "movie_credits": movieCredits == null ? null : movieCredits.toMap(),
//       };
// }
