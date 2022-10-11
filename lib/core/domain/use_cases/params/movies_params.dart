import 'package:equatable/equatable.dart';

class MoviesParams extends Equatable {
  final String baseUrl;
  final String url;
  final Map<String, String> query;

  const MoviesParams({
    required this.baseUrl,
    required this.url,
    required this.query,
  });

  @override
  List<Object?> get props => [
        baseUrl,
        url,
        query,
      ];
}
