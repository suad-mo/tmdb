import 'package:tmdb/features/person/domain/entities/person_base_entity.dart';

class PersonBaseModel extends PersonBaseEntity {
  final String? knownForDepartment;
  final double? popularity;
  const PersonBaseModel({
    required this.knownForDepartment,
    required this.popularity,
    required super.id,
    required super.name,
    super.profilePath,
  });

  factory PersonBaseModel.fromJson(Map<String, dynamic> json) {
    final id = (json['id']) as int;
    final String name = json['name'].toString();
    final String? profilePath = json['profile_path'];
    final String? knownForDepartment = json['known_for_department'] as String?;
    final popularity = json['popularity'] as double?;
    return PersonBaseModel(
      id: id,
      name: name,
      profilePath: profilePath,
      knownForDepartment: knownForDepartment,
      popularity: popularity,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['profile_path'] = profilePath;
    data['known_for_department'] = knownForDepartment;
    data['popularity'] = popularity;

    return data;
  }
}

class PopularPersons {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PopularPersons({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  PopularPersons.fromJson(Map<String, dynamic> json) {
    page = json['page'] as int?;
    results = (json['results'] as List?)
        ?.map((dynamic e) => Results.fromJson(e as Map<String, dynamic>))
        .toList();
    totalPages = json['total_pages'] as int?;
    totalResults = json['total_results'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['page'] = page;
    json['results'] = results?.map((e) => e.toJson()).toList();
    json['total_pages'] = totalPages;
    json['total_results'] = totalResults;
    return json;
  }
}

class Results {
  int? id;
  String? name;
  String? profilePath;

  bool? adult;
  int? gender;
  List<KnownFor>? knownFor;
  String? knownForDepartment;
  double? popularity;

  Results({
    this.adult,
    this.gender,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
  });

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    gender = json['gender'] as int?;
    id = json['id'] as int?;
    knownFor = (json['known_for'] as List?)
        ?.map((dynamic e) => KnownFor.fromJson(e as Map<String, dynamic>))
        .toList();
    knownForDepartment = json['known_for_department'] as String?;
    name = json['name'] as String?;
    popularity = json['popularity'] as double?;
    profilePath = json['profile_path'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['gender'] = gender;
    json['id'] = id;
    json['known_for'] = knownFor?.map((e) => e.toJson()).toList();
    json['known_for_department'] = knownForDepartment;
    json['name'] = name;
    json['popularity'] = popularity;
    json['profile_path'] = profilePath;
    return json;
  }
}

class KnownFor {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? mediaType;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  KnownFor({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.mediaType,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    backdropPath = json['backdrop_path'] as String?;
    genreIds =
        (json['genre_ids'] as List?)?.map((dynamic e) => e as int).toList();
    id = json['id'] as int?;
    mediaType = json['media_type'] as String?;
    originalLanguage = json['original_language'] as String?;
    originalTitle = json['original_title'] as String?;
    overview = json['overview'] as String?;
    posterPath = json['poster_path'] as String?;
    releaseDate = json['release_date'] as String?;
    title = json['title'] as String?;
    video = json['video'] as bool?;
    voteAverage = json['vote_average'] as double?;
    voteCount = json['vote_count'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['backdrop_path'] = backdropPath;
    json['genre_ids'] = genreIds;
    json['id'] = id;
    json['media_type'] = mediaType;
    json['original_language'] = originalLanguage;
    json['original_title'] = originalTitle;
    json['overview'] = overview;
    json['poster_path'] = posterPath;
    json['release_date'] = releaseDate;
    json['title'] = title;
    json['video'] = video;
    json['vote_average'] = voteAverage;
    json['vote_count'] = voteCount;
    return json;
  }
}
