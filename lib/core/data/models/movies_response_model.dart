// import 'package:dartz/dartz_unsafe.dart';
import 'package:tmdb/core/data/models/movie_model.dart';
import 'package:tmdb/core/domain/entities/movie_entity.dart';
import 'package:tmdb/core/domain/entities/movies_response_entity.dart';

class MoviesResponseModel extends MoviesResponseEntity {
  MoviesResponseModel({
    required int page,
    required this.moviesM,
    required int totalPages,
    required int totalResults,
  }) : super(
          movies: moviesM
              .map((e) => MovieEntity(
                  id: e.id,
                  title: e.title,
                  posterPath: e.posterPath,
                  voteAverage: e.voteAverage,
                  releaseDate: e.releaseDate,
                  genres: e.genres))
              .toList(),
          page: page,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  // final int page;

  final List<MovieModel> moviesM;
  // final int totalPages;
  // final int totalResults;

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    //print(json['results'][0]['id'].toString());
    final m = <MovieModel>[];
    json['results'].forEach((result) {
      m.add(MovieModel.fromJson(result));
    });
    return MoviesResponseModel(
      page: (json['page']) as int, // ?? 0,
      moviesM: m,
      // List.from(json['results']).map((e) {
      //   print(e['id'].toString());
      //   return MovieModel.fromJson(e);
      // }).toList(),
      totalPages: (json['total_pages']) as int, // ?? 0,
      totalResults: (json['total_results']) as int, // ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    data['results'] = moviesM.map((e) => e.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
