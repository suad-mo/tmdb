class MoviesDetailModel {
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  Videos? videos;
  Images? images;
  Credits? credits;

  MoviesDetailModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.videos,
    this.images,
    this.credits,
  });

  MoviesDetailModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    backdropPath = json['backdrop_path'] as String?;
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'] as int?;
    genres = (json['genres'] as List?)
        ?.map((dynamic e) => Genres.fromJson(e as Map<String, dynamic>))
        .toList();
    homepage = json['homepage'] as String?;
    id = json['id'] as int?;
    imdbId = json['imdb_id'] as String?;
    originalLanguage = json['original_language'] as String?;
    originalTitle = json['original_title'] as String?;
    overview = json['overview'] as String?;
    popularity = json['popularity'] as double?;
    posterPath = json['poster_path'] as String?;
    productionCompanies = (json['production_companies'] as List?)
        ?.map((dynamic e) =>
            ProductionCompanies.fromJson(e as Map<String, dynamic>))
        .toList();
    productionCountries = (json['production_countries'] as List?)
        ?.map((dynamic e) =>
            ProductionCountries.fromJson(e as Map<String, dynamic>))
        .toList();
    releaseDate = json['release_date'] as String?;
    revenue = json['revenue'] as int?;
    runtime = json['runtime'] as int?;
    spokenLanguages = (json['spoken_languages'] as List?)
        ?.map(
            (dynamic e) => SpokenLanguages.fromJson(e as Map<String, dynamic>))
        .toList();
    status = json['status'] as String?;
    tagline = json['tagline'] as String?;
    title = json['title'] as String?;
    video = json['video'] as bool?;
    voteAverage = json['vote_average'] as double?;
    voteCount = json['vote_count'] as int?;
    videos = (json['videos'] as Map<String, dynamic>?) != null
        ? Videos.fromJson(json['videos'] as Map<String, dynamic>)
        : null;
    images = (json['images'] as Map<String, dynamic>?) != null
        ? Images.fromJson(json['images'] as Map<String, dynamic>)
        : null;
    credits = (json['credits'] as Map<String, dynamic>?) != null
        ? Credits.fromJson(json['credits'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['backdrop_path'] = backdropPath;
    json['belongs_to_collection'] = belongsToCollection;
    json['budget'] = budget;
    json['genres'] = genres?.map((e) => e.toJson()).toList();
    json['homepage'] = homepage;
    json['id'] = id;
    json['imdb_id'] = imdbId;
    json['original_language'] = originalLanguage;
    json['original_title'] = originalTitle;
    json['overview'] = overview;
    json['popularity'] = popularity;
    json['poster_path'] = posterPath;
    json['production_companies'] =
        productionCompanies?.map((e) => e.toJson()).toList();
    json['production_countries'] =
        productionCountries?.map((e) => e.toJson()).toList();
    json['release_date'] = releaseDate;
    json['revenue'] = revenue;
    json['runtime'] = runtime;
    json['spoken_languages'] = spokenLanguages?.map((e) => e.toJson()).toList();
    json['status'] = status;
    json['tagline'] = tagline;
    json['title'] = title;
    json['video'] = video;
    json['vote_average'] = voteAverage;
    json['vote_count'] = voteCount;
    json['videos'] = videos?.toJson();
    json['images'] = images?.toJson();
    json['credits'] = credits?.toJson();
    return json;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    return json;
  }
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    logoPath = json['logo_path'] as String?;
    name = json['name'] as String?;
    originCountry = json['origin_country'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['logo_path'] = logoPath;
    json['name'] = name;
    json['origin_country'] = originCountry;
    return json;
  }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({
    this.iso31661,
    this.name,
  });

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'] as String?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['iso_3166_1'] = iso31661;
    json['name'] = name;
    return json;
  }
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,
  });

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'] as String?;
    iso6391 = json['iso_639_1'] as String?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['english_name'] = englishName;
    json['iso_639_1'] = iso6391;
    json['name'] = name;
    return json;
  }
}

class Videos {
  List<Results>? results;

  Videos({
    this.results,
  });

  Videos.fromJson(Map<String, dynamic> json) {
    results = (json['results'] as List?)
        ?.map((dynamic e) => Results.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['results'] = results?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Results {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  Results({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  Results.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'] as String?;
    iso31661 = json['iso_3166_1'] as String?;
    name = json['name'] as String?;
    key = json['key'] as String?;
    site = json['site'] as String?;
    size = json['size'] as int?;
    type = json['type'] as String?;
    official = json['official'] as bool?;
    publishedAt = json['published_at'] as String?;
    id = json['id'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['iso_639_1'] = iso6391;
    json['iso_3166_1'] = iso31661;
    json['name'] = name;
    json['key'] = key;
    json['site'] = site;
    json['size'] = size;
    json['type'] = type;
    json['official'] = official;
    json['published_at'] = publishedAt;
    json['id'] = id;
    return json;
  }
}

class Images {
  List<Backdrops>? backdrops;
  List<Logos>? logos;
  List<Posters>? posters;

  Images({
    this.backdrops,
    this.logos,
    this.posters,
  });

  Images.fromJson(Map<String, dynamic> json) {
    backdrops = (json['backdrops'] as List?)
        ?.map((dynamic e) => Backdrops.fromJson(e as Map<String, dynamic>))
        .toList();
    logos = (json['logos'] as List?)
        ?.map((dynamic e) => Logos.fromJson(e as Map<String, dynamic>))
        .toList();
    posters = (json['posters'] as List?)
        ?.map((dynamic e) => Posters.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['backdrops'] = backdrops?.map((e) => e.toJson()).toList();
    json['logos'] = logos?.map((e) => e.toJson()).toList();
    json['posters'] = posters?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Backdrops {
  double? aspectRatio;
  int? height;
  dynamic iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  Backdrops({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  Backdrops.fromJson(Map<String, dynamic> json) {
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

class Logos {
  double? aspectRatio;
  int? height;
  String? iso6391;
  String? filePath;
  int? voteAverage;
  int? voteCount;
  int? width;

  Logos({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  Logos.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'] as double?;
    height = json['height'] as int?;
    iso6391 = json['iso_639_1'] as String?;
    filePath = json['file_path'] as String?;
    voteAverage = json['vote_average'] as int?;
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

class Posters {
  double? aspectRatio;
  int? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  Posters({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  Posters.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'] as double?;
    height = json['height'] as int?;
    iso6391 = json['iso_639_1'] as String?;
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

class Credits {
  List<Cast>? cast;
  List<Crew>? crew;

  Credits({
    this.cast,
    this.crew,
  });

  Credits.fromJson(Map<String, dynamic> json) {
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
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    gender = json['gender'] as int?;
    id = json['id'] as int?;
    knownForDepartment = json['known_for_department'] as String?;
    name = json['name'] as String?;
    originalName = json['original_name'] as String?;
    popularity = json['popularity'] as double?;
    profilePath = json['profile_path'] as String?;
    castId = json['cast_id'] as int?;
    character = json['character'] as String?;
    creditId = json['credit_id'] as String?;
    order = json['order'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['gender'] = gender;
    json['id'] = id;
    json['known_for_department'] = knownForDepartment;
    json['name'] = name;
    json['original_name'] = originalName;
    json['popularity'] = popularity;
    json['profile_path'] = profilePath;
    json['cast_id'] = castId;
    json['character'] = character;
    json['credit_id'] = creditId;
    json['order'] = order;
    return json;
  }
}

class Crew {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    gender = json['gender'] as int?;
    id = json['id'] as int?;
    knownForDepartment = json['known_for_department'] as String?;
    name = json['name'] as String?;
    originalName = json['original_name'] as String?;
    popularity = json['popularity'] as double?;
    profilePath = json['profile_path'] as String?;
    creditId = json['credit_id'] as String?;
    department = json['department'] as String?;
    job = json['job'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['gender'] = gender;
    json['id'] = id;
    json['known_for_department'] = knownForDepartment;
    json['name'] = name;
    json['original_name'] = originalName;
    json['popularity'] = popularity;
    json['profile_path'] = profilePath;
    json['credit_id'] = creditId;
    json['department'] = department;
    json['job'] = job;
    return json;
  }
}
