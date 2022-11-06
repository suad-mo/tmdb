import 'package:equatable/equatable.dart';

class PersonBaseEntity extends Equatable {
  final int id;
  final String name;
  final String? profilePath;

  const PersonBaseEntity({
    required this.id,
    required this.name,
    this.profilePath,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        profilePath,
      ];
}
