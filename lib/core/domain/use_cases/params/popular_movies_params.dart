import 'package:equatable/equatable.dart';
import 'package:tmdb/core/configuration/request/request_movies.dart';

class PopularMovieParams extends Equatable {
  static const title = 'Popular';
  final RequestMovies requestMovies;

  const PopularMovieParams({required this.requestMovies});

  @override
  List<Object?> get props => [requestMovies];
}
