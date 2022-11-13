import 'package:tmdb/features/movie/data/models/movie_cast_model.dart';
import 'package:tmdb/features/person/domain/entities/person_movie_credits_entity.dart';

import '../../../movie/data/models/movie_crew_model.dart';

class PersonMovieCreditsModel extends PersonMovieCreditsEntity {
  const PersonMovieCreditsModel({
    required List<MovieCastModel>? cast,
    required List<MovieCrewModel>? crew,
  }) : super(cast: cast, crew: crew);

  factory PersonMovieCreditsModel.fromJsonWithMovieCredits(
          Map<String, dynamic> json) =>
      PersonMovieCreditsModel(
        cast: json['movie_credits']['cast'] == null
            ? null
            : List<MovieCastModel>.from(json['movie_credits']['cast']
                .map((x) => MovieCastModel.fromJson(x))),
        crew: json['movie_credits']['crew'] == null
            ? null
            : List<MovieCrewModel>.from(json['movie_credits']['crew']
                .map((x) => MovieCrewModel.fromJson(x))),
      );

  factory PersonMovieCreditsModel.fromJsonOnly(Map<String, dynamic> json) =>
      PersonMovieCreditsModel(
        cast: json['cast'] == null
            ? null
            : List<MovieCastModel>.from(
                json['cast'].map((x) => MovieCastModel.fromJson(x))),
        crew: json['crew'] == null
            ? null
            : List<MovieCrewModel>.from(
                json['crew'].map((x) => MovieCrewModel.fromJson(x))),
      );
}
