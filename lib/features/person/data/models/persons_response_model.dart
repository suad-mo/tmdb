import 'package:tmdb/features/person/data/models/person_base_model.dart';
import 'package:tmdb/features/person/domain/entities/person_base_entity.dart';
import 'package:tmdb/features/person/domain/entities/pesons_response_entity.dart';

class PersonsResponseModel extends PersonsResponseEntity {
  PersonsResponseModel(
      {required int page,
      required this.personBaseModels,
      required int totalPages,
      required int totalResults})
      : super(
          page: page,
          totalPages: totalPages,
          totalResults: page,
          persons: personBaseModels
              .map((e) => PersonBaseEntity(
                    id: e.id,
                    name: e.name,
                    profilePath: e.profilePath,
                  ))
              .toList(),
        );

  final List<PersonBaseModel> personBaseModels;

  factory PersonsResponseModel.fromJson(Map<String, dynamic> json) {
    final p = <PersonBaseModel>[];
    json['results'].forEach((result) {
      p.add(PersonBaseModel.fromJson(result));
    });
    return PersonsResponseModel(
      page: (json['page']) as int,
      personBaseModels: p,
      totalPages: (json['total_pages']) as int,
      totalResults: (json['total_results']) as int,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    data['results'] = personBaseModels.map((e) => e.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
