class TvDetailModel {
  bool? adult;
  String? backdropPath;
  List<CreatedBy>? createdBy;
  List<int>? episodeRunTime;
  String? firstAirDate;
  List<Genres>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String>? languages;
  String? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  dynamic nextEpisodeToAir;
  List<Networks>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  List<Seasons>? seasons;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;
  Videos? videos;
  Credits? credits;
  Images? images;

  TvDetailModel({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
    this.videos,
    this.credits,
    this.images,
  });

  TvDetailModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] as bool?;
    backdropPath = json['backdrop_path'] as String?;
    createdBy = (json['created_by'] as List?)
        ?.map((dynamic e) => CreatedBy.fromJson(e as Map<String, dynamic>))
        .toList();
    episodeRunTime = (json['episode_run_time'] as List?)
        ?.map((dynamic e) => e as int)
        .toList();
    firstAirDate = json['first_air_date'] as String?;
    genres = (json['genres'] as List?)
        ?.map((dynamic e) => Genres.fromJson(e as Map<String, dynamic>))
        .toList();
    homepage = json['homepage'] as String?;
    id = json['id'] as int?;
    inProduction = json['in_production'] as bool?;
    languages =
        (json['languages'] as List?)?.map((dynamic e) => e as String).toList();
    lastAirDate = json['last_air_date'] as String?;
    lastEpisodeToAir =
        (json['last_episode_to_air'] as Map<String, dynamic>?) != null
            ? LastEpisodeToAir.fromJson(
                json['last_episode_to_air'] as Map<String, dynamic>)
            : null;
    name = json['name'] as String?;
    nextEpisodeToAir = json['next_episode_to_air'];
    networks = (json['networks'] as List?)
        ?.map((dynamic e) => Networks.fromJson(e as Map<String, dynamic>))
        .toList();
    numberOfEpisodes = json['number_of_episodes'] as int?;
    numberOfSeasons = json['number_of_seasons'] as int?;
    originCountry = (json['origin_country'] as List?)
        ?.map((dynamic e) => e as String)
        .toList();
    originalLanguage = json['original_language'] as String?;
    originalName = json['original_name'] as String?;
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
    seasons = (json['seasons'] as List?)
        ?.map((dynamic e) => Seasons.fromJson(e as Map<String, dynamic>))
        .toList();
    spokenLanguages = (json['spoken_languages'] as List?)
        ?.map(
            (dynamic e) => SpokenLanguages.fromJson(e as Map<String, dynamic>))
        .toList();
    status = json['status'] as String?;
    tagline = json['tagline'] as String?;
    type = json['type'] as String?;
    voteAverage = json['vote_average'] as double?;
    voteCount = json['vote_count'] as int?;
    videos = (json['videos'] as Map<String, dynamic>?) != null
        ? Videos.fromJson(json['videos'] as Map<String, dynamic>)
        : null;
    credits = (json['credits'] as Map<String, dynamic>?) != null
        ? Credits.fromJson(json['credits'] as Map<String, dynamic>)
        : null;
    images = (json['images'] as Map<String, dynamic>?) != null
        ? Images.fromJson(json['images'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['backdrop_path'] = backdropPath;
    json['created_by'] = createdBy?.map((e) => e.toJson()).toList();
    json['episode_run_time'] = episodeRunTime;
    json['first_air_date'] = firstAirDate;
    json['genres'] = genres?.map((e) => e.toJson()).toList();
    json['homepage'] = homepage;
    json['id'] = id;
    json['in_production'] = inProduction;
    json['languages'] = languages;
    json['last_air_date'] = lastAirDate;
    json['last_episode_to_air'] = lastEpisodeToAir?.toJson();
    json['name'] = name;
    json['next_episode_to_air'] = nextEpisodeToAir;
    json['networks'] = networks?.map((e) => e.toJson()).toList();
    json['number_of_episodes'] = numberOfEpisodes;
    json['number_of_seasons'] = numberOfSeasons;
    json['origin_country'] = originCountry;
    json['original_language'] = originalLanguage;
    json['original_name'] = originalName;
    json['overview'] = overview;
    json['popularity'] = popularity;
    json['poster_path'] = posterPath;
    json['production_companies'] =
        productionCompanies?.map((e) => e.toJson()).toList();
    json['production_countries'] =
        productionCountries?.map((e) => e.toJson()).toList();
    json['seasons'] = seasons?.map((e) => e.toJson()).toList();
    json['spoken_languages'] = spokenLanguages?.map((e) => e.toJson()).toList();
    json['status'] = status;
    json['tagline'] = tagline;
    json['type'] = type;
    json['vote_average'] = voteAverage;
    json['vote_count'] = voteCount;
    json['videos'] = videos?.toJson();
    json['credits'] = credits?.toJson();
    json['images'] = images?.toJson();
    return json;
  }
}

class CreatedBy {
  int? id;
  String? creditId;
  String? name;
  int? gender;
  String? profilePath;

  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    creditId = json['credit_id'] as String?;
    name = json['name'] as String?;
    gender = json['gender'] as int?;
    profilePath = json['profile_path'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['credit_id'] = creditId;
    json['name'] = name;
    json['gender'] = gender;
    json['profile_path'] = profilePath;
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

class LastEpisodeToAir {
  String? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;
  double? voteAverage;
  int? voteCount;

  LastEpisodeToAir({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'] as String?;
    episodeNumber = json['episode_number'] as int?;
    id = json['id'] as int?;
    name = json['name'] as String?;
    overview = json['overview'] as String?;
    productionCode = json['production_code'] as String?;
    runtime = json['runtime'] as int?;
    seasonNumber = json['season_number'] as int?;
    showId = json['show_id'] as int?;
    stillPath = json['still_path'] as String?;
    voteAverage = json['vote_average'] as double?;
    voteCount = json['vote_count'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['air_date'] = airDate;
    json['episode_number'] = episodeNumber;
    json['id'] = id;
    json['name'] = name;
    json['overview'] = overview;
    json['production_code'] = productionCode;
    json['runtime'] = runtime;
    json['season_number'] = seasonNumber;
    json['show_id'] = showId;
    json['still_path'] = stillPath;
    json['vote_average'] = voteAverage;
    json['vote_count'] = voteCount;
    return json;
  }
}

class Networks {
  int? id;
  String? name;
  String? logoPath;
  String? originCountry;

  Networks({
    this.id,
    this.name,
    this.logoPath,
    this.originCountry,
  });

  Networks.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    logoPath = json['logo_path'] as String?;
    originCountry = json['origin_country'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['logo_path'] = logoPath;
    json['origin_country'] = originCountry;
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

class Seasons {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;

  Seasons({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
  });

  Seasons.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'] as String?;
    episodeCount = json['episode_count'] as int?;
    id = json['id'] as int?;
    name = json['name'] as String?;
    overview = json['overview'] as String?;
    posterPath = json['poster_path'] as String?;
    seasonNumber = json['season_number'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['air_date'] = airDate;
    json['episode_count'] = episodeCount;
    json['id'] = id;
    json['name'] = name;
    json['overview'] = overview;
    json['poster_path'] = posterPath;
    json['season_number'] = seasonNumber;
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
  double? voteAverage;
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
