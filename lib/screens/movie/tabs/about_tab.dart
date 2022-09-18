import 'package:flutter/material.dart';
import 'package:tmdb/data/genres.dart';

import '../../../models/movie.dart';

class AboutTab extends StatelessWidget {
  const AboutTab(this.movie, {super.key});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview:',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movie.overview ?? '',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Genres:',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: _list(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Original Title'),
              const SizedBox(width: 5),
              Text(movie.originalTitle ?? 'Original Title')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Status'),
              const SizedBox(width: 5),
              Text(movie.status ?? 'Status')
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 150, child: Text('Rantime')),
              const SizedBox(width: 10),
              Text(
                '${movie.runtime! ~/ 60}hr and ${movie.runtime! - (movie.runtime! ~/ 60) * 60} min',
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _list() {
    final List<Widget> genres = <Widget>[];
    final g = movie.genres;
    if (g != null) {
      for (var e in g) {
        final w = Padding(
          padding: const EdgeInsets.all(4.0),
          child: OutlinedButton(
            // style: ButtonStyle(backgroundColor: ),
            onPressed: (() {}),

            // style: OutlinedButtonTheme.of(context).style.backgroundColor:,
            child: Text(
              e.name ?? '',
              style: const TextStyle(
                // background: Paint()..color,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        genres.add(w);
      }
    }

    return genres;
  }
}
