import '../../../tv/data/models/tv_cast_model.dart';
import '../../domain/entities/person_tv_credits_entity.dart';

class PersonTvCreditsModel extends PersonTvCreditsEntity {
  const PersonTvCreditsModel({
    required List<TvCastModel>? cast,
  }) : super(cast: cast);

  factory PersonTvCreditsModel.fromJsonWithMovieCredits(
          Map<String, dynamic> json) =>
      PersonTvCreditsModel(
        cast: json['movie_credits']['cast'] == null
            ? null
            : List<TvCastModel>.from(json['movie_credits']['cast']
                .map((x) => TvCastModel.fromJson(x))),
        // crew: json['movie_credits']['crew'] == null
        //     ? null
        //     : List<MovieCrewModel>.from(json['movie_credits']['crew']
        //         .map((x) => MovieCrewModel.fromJson(x))),
      );

  factory PersonTvCreditsModel.fromJsonOnly(Map<String, dynamic> json) =>
      PersonTvCreditsModel(
        cast: json['cast'] == null
            ? null
            : List<TvCastModel>.from(
                json['cast'].map((x) => TvCastModel.fromJson(x))),
        // crew: json['crew'] == null
        //     ? null
        //     : List<MovieCrewModel>.from(
        //         json['crew'].map((x) => MovieCrewModel.fromJson(x))),
      );
}
