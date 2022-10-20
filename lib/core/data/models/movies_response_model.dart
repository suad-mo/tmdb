import 'package:dartz/dartz_unsafe.dart';
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
    print(json['results'][0]['id'].toString());
    final m = <MovieModel>[];
    json['results'].forEach((result) {
      m.add(MovieModel.fromJson(result));
    });
    return MoviesResponseModel(
      page: int.tryParse(json['page']) ?? 0,
      movies: m,
      // List.from(json['results']).map((e) {
      //   print(e['id'].toString());
      //   return MovieModel.fromJson(e);
      // }).toList(),
      totalPages: int.tryParse(json['total_pages']) ?? 0,
      totalResults: int.tryParse(json['total_results']) ?? 0,
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
