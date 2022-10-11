import 'package:equatable/equatable.dart';

class PopularMovieParams extends Equatable {
  static const path = '3/movie/popular';
  static const title = 'Popular';
  final int page;

  const PopularMovieParams({required this.page});

  Map<String, String> get query {
    return {
      'page': page.toString(),
    };
  }

  @override
  List<Object?> get props => [page];
}
