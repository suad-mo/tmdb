import '../../domen/entities/movie_cast_entity.dart';

import 'movie_base_model.dart';

class MovieCastModel extends MovieCastEntity {
  final MovieBaseModel baseModel;

  MovieCastModel({
    required super.creditId,
    required super.character,
    required super.order,
    required this.baseModel,
  }) : super(baseEntity: baseModel);

  factory MovieCastModel.fromJson(Map<String, dynamic> json) => MovieCastModel(
        creditId: json['credit_id'],
        character: json['character'],
        order: num.parse(json['order'] ?? '-1').toInt(),
        baseModel: MovieBaseModel.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        ...baseModel.toJson(),
        'character': character,
        'credit_id': creditId,
        'order': order,
      };
}
