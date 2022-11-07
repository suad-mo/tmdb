import 'package:equatable/equatable.dart';

import 'person_base_entity.dart';

class PersonsResponseEntity extends Equatable {
  const PersonsResponseEntity({
    required this.page,
    required this.persons,
    required this.totalPages,
    required this.totalResults,
  });
  final int page;
  final List<PersonBaseEntity> persons;
  final int totalPages;
  final int totalResults;

  @override
  List<Object?> get props => [
        page,
        persons,
        totalPages,
        totalResults,
      ];
}
