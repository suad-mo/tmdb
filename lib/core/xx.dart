//import 'xx.dart';

import 'package:equatable/equatable.dart';
import 'package:tmdb/models/movie.dart';

enum MediaType {
  movie,
  tv,
  preson,
}

enum MediaTypeWithAll {
  movie,
  tv,
  preson,
  all,
}

enum TimeWindow {
  day,
  week,
}

class RequestTmbdListMedia {
  final RequestQuery requestQuery;
  final List<String> pathParams;

  RequestTmbdListMedia({
    required this.requestQuery,
    required this.pathParams,
  });
}

class RequestQuery {
  final int page;
  final String language;
  String? region;

  RequestQuery({
    this.page = 1,
    this.language = 'en-US',
  });
}

final List<String> x = ['3', MediaType.movie.name, TimeWindow.week.name];

// ignore: must_be_immutable
abstract class ListMovies extends Equatable {
  final List<Movie> _movies = <Movie>[];
  int page = 0;
  int totalPage = 0;
  int totalResult = 0;

  Future<void> initList();

  Future<List<Movie>> get movies => Future.value(_movies);
}
