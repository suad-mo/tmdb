import 'package:equatable/equatable.dart';

class PersonParams extends Equatable {
  final int _id;

  const PersonParams({required int id}) : _id = id;

  int get id => _id;

  @override
  List<Object> get props => [_id];
}

class Params extends Equatable {
  final int _id;

  const Params({required int id}) : _id = id;

  int get id => _id;

  @override
  List<Object?> get props => [_id];
}
