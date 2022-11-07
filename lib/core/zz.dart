// import 'package:equatable/equatable.dart';

// Part of Tv details
class CreatedBy {
  int? id;
  String? name;
  String? profilePath;

  String? creditId;
  int? gender;

  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });
}

class PersonDetailEntity {
  int? id; //
  String? name; //
  String? profilePath; //

  String? knownForDepartment; //
  //Age
  DateTime? birthday;
  DateTime? deathday;
  String? biography;
  String? placeOfBirth;
  List<String>? alsoKnownAs;

  bool? adult; //
  int? gender; //
  double? popularity; //

  String? homepage;
  String? imdbId;

  // MovieCredits? movieCredits;
  Images? images;

  PersonDetailEntity({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });
}

class PersonDetails {
  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  dynamic deathday;
  int? gender;
  String? homepage;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;
  MovieCredits? movieCredits;
  Images? images;

  PersonDetails({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
    this.movieCredits,
    this.images,
  });

  PersonDetails.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    alsoKnownAs = (json['also_known_as'] as List?)
        ?.map((dynamic e) => e as String)
        .toList();
    biography = json['biography'] as String?;
    birthday = json['birthday'] as String?;
    deathday = json['deathday'];
    gender = json['gender'] as int?;
    homepage = json['homepage'] as String?;
    id = json['id'] as int?;
    imdbId = json['imdb_id'] as String?;
    knownForDepartment = json['known_for_department'] as String?;
    name = json['name'] as String?;
    placeOfBirth = json['place_of_birth'] as String?;
    popularity = json['popularity'] as double?;
    profilePath = json['profile_path'] as String?;
    movieCredits = (json['movie_credits'] as Map<String, dynamic>?) != null
        ? MovieCredits.fromJson(json['movie_credits'] as Map<String, dynamic>)
        : null;
    images = (json['images'] as Map<String, dynamic>?) != null
        ? Images.fromJson(json['images'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['also_known_as'] = alsoKnownAs;
    json['biography'] = biography;
    json['birthday'] = birthday;
    json['deathday'] = deathday;
    json['gender'] = gender;
    json['homepage'] = homepage;
    json['id'] = id;
    json['imdb_id'] = imdbId;
    json['known_for_department'] = knownForDepartment;
    json['name'] = name;
    json['place_of_birth'] = placeOfBirth;
    json['popularity'] = popularity;
    json['profile_path'] = profilePath;
    json['movie_credits'] = movieCredits?.toJson();
    json['images'] = images?.toJson();
    return json;
  }
}

class MovieCredits {
  List<Cast>? cast;
  List<Crew>? crew;

  MovieCredits({
    this.cast,
    this.crew,
  });

  MovieCredits.fromJson(Map<String, dynamic> json) {
    cast = (json['cast'] as List?)
        ?.map((dynamic e) => Cast.fromJson(e as Map<String, dynamic>))
        .toList();
    crew = (json['crew'] as List?)
        ?.map((dynamic e) => Crew.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['cast'] = cast?.map((e) => e.toJson()).toList();
    json['crew'] = crew?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Cast {
  int? id; //
  String? title; //
  String? posterPath; //
  double? voteAverage; //
  String? releaseDate; //
  String? backdropPath; //

  bool? adult; //
  List<int>? genreIds; //
  String? originalLanguage; //
  String? originalTitle; //
  String? overview; //
  double? popularity; //
  bool? video; //
  int? voteCount; //
  String? creditId; //

  String? character;
  int? order;

  // bool? adult;
  // String? backdropPath;
  // List<int>? genreIds;
  // int? id;
  // String? originalLanguage;
  // String? originalTitle;
  // String? overview;
  // double? popularity;
  // String? posterPath;
  // String? releaseDate;
  // String? title;
  // bool? video;
  // double? voteAverage;
  // int? voteCount;
  // String? creditId;

  String? department;
  String? job;

  Cast({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.character,
    this.creditId,
    this.order,
  });

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    backdropPath = json['backdrop_path'] as String?;
    genreIds =
        (json['genre_ids'] as List?)?.map((dynamic e) => e as int).toList();
    id = json['id'] as int?;
    originalLanguage = json['original_language'] as String?;
    originalTitle = json['original_title'] as String?;
    overview = json['overview'] as String?;
    popularity = json['popularity'] as double?;
    posterPath = json['poster_path'] as String?;
    releaseDate = json['release_date'] as String?;
    title = json['title'] as String?;
    video = json['video'] as bool?;
    voteAverage = json['vote_average'] as double?;
    voteCount = json['vote_count'] as int?;
    character = json['character'] as String?;
    creditId = json['credit_id'] as String?;
    order = json['order'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['backdrop_path'] = backdropPath;
    json['genre_ids'] = genreIds;
    json['id'] = id;
    json['original_language'] = originalLanguage;
    json['original_title'] = originalTitle;
    json['overview'] = overview;
    json['popularity'] = popularity;
    json['poster_path'] = posterPath;
    json['release_date'] = releaseDate;
    json['title'] = title;
    json['video'] = video;
    json['vote_average'] = voteAverage;
    json['vote_count'] = voteCount;
    json['character'] = character;
    json['credit_id'] = creditId;
    json['order'] = order;
    return json;
  }
}

class Crew {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? creditId;
  String? department;
  String? job;

  Crew({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.creditId,
    this.department,
    this.job,
  });

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    backdropPath = json['backdrop_path'] as String?;
    genreIds =
        (json['genre_ids'] as List?)?.map((dynamic e) => e as int).toList();
    id = json['id'] as int?;
    originalLanguage = json['original_language'] as String?;
    originalTitle = json['original_title'] as String?;
    overview = json['overview'] as String?;
    popularity = json['popularity'] as double?;
    posterPath = json['poster_path'] as String?;
    releaseDate = json['release_date'] as String?;
    title = json['title'] as String?;
    video = json['video'] as bool?;
    voteAverage = json['vote_average'] as double?;
    voteCount = json['vote_count'] as int?;
    creditId = json['credit_id'] as String?;
    department = json['department'] as String?;
    job = json['job'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['backdrop_path'] = backdropPath;
    json['genre_ids'] = genreIds;
    json['id'] = id;
    json['original_language'] = originalLanguage;
    json['original_title'] = originalTitle;
    json['overview'] = overview;
    json['popularity'] = popularity;
    json['poster_path'] = posterPath;
    json['release_date'] = releaseDate;
    json['title'] = title;
    json['video'] = video;
    json['vote_average'] = voteAverage;
    json['vote_count'] = voteCount;
    json['credit_id'] = creditId;
    json['department'] = department;
    json['job'] = job;
    return json;
  }
}

class Images {
  List<Profiles>? profiles;

  Images({
    this.profiles,
  });

  Images.fromJson(Map<String, dynamic> json) {
    profiles = (json['profiles'] as List?)
        ?.map((dynamic e) => Profiles.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['profiles'] = profiles?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Profiles {
  double? aspectRatio;
  int? height;
  dynamic iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  Profiles({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  Profiles.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'] as double?;
    height = json['height'] as int?;
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'] as String?;
    voteAverage = json['vote_average'] as double?;
    voteCount = json['vote_count'] as int?;
    width = json['width'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['aspect_ratio'] = aspectRatio;
    json['height'] = height;
    json['iso_639_1'] = iso6391;
    json['file_path'] = filePath;
    json['vote_average'] = voteAverage;
    json['vote_count'] = voteCount;
    json['width'] = width;
    return json;
  }
}
