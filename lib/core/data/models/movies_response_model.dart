import 'package:tmdb/core/data/models/movie_model.dart';

class MoviesResponseModel {
  MoviesResponseModel({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
  final int page;
  final List<MovieModel> movies;
  final int totalPages;
  final int totalResults;

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return MoviesResponseModel(
      page: json['page'],
      movies: List.from(json['results'])
          .map((e) => MovieModel.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    data['results'] = movies.map((e) => e.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
