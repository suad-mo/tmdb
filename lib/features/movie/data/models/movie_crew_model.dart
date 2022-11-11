import '../../domen/entities/movie_crew_entity.dart';
import 'movie_base_model.dart';

class MovieCrewModel extends MovieCrewEntity {
  final MovieBaseModel baseModel;

  MovieCrewModel({
    required super.creditId,
    required super.department,
    required super.job,
    required this.baseModel,
  }) : super(baseEntity: baseModel);

  factory MovieCrewModel.fromJson(Map<String, dynamic> json) => MovieCrewModel(
        creditId: json['credit_id'],
        department: json['department'],
        job: json['job'],
        baseModel: MovieBaseModel.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        ...baseModel.toJson(),
        'department': department,
        'credit_id': creditId,
        'job': job,
      };
}
