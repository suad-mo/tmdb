import 'package:equatable/equatable.dart';

class MoviesParams extends Equatable {
  final String path;
  final Map<String, String>? query;

  const MoviesParams({
    required this.path,
    required this.query,
  });

  @override
  List<Object?> get props => [
        path,
        query,
      ];
}
