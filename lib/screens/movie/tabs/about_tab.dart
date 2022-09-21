import 'package:flutter/material.dart';
// import 'package:tmdb/data/genres.dart';

import '../../../models/movie.dart';

class AboutTab extends StatelessWidget {
  const AboutTab(this.movie, {super.key});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
            style: const TextStyle(
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
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.genres?.length ?? 0,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                    onPressed: (() {
                      // print(movie.genres?[index].id.toString());
                    }),
                    child: Text(
                      movie.genres?[index].name ?? '',
                      style: const TextStyle(
                        // background: Paint()..color,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Expanded(child: Text('Original Title')),
                Expanded(child: Text(movie.originalTitle ?? 'Original Title'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Expanded(child: Text('Status')),
                Expanded(child: Text(movie.status ?? 'Status'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Expanded(child: Text('Rantime')),
                Expanded(
                    child: Text(
                  '${movie.runtime! ~/ 60}hr and ${movie.runtime! - (movie.runtime! ~/ 60) * 60} min',
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Expanded(child: Text('Original Language')),
                Expanded(
                    child: Text(movie.originalLanguage ?? 'Original Language'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    heightFactor:
                        (movie.productionCountries?.length ?? 1).toDouble(),
                    alignment: Alignment.topLeft,
                    // color: Colors.amberAccent,
                    child: const Text(
                      'Production Countries',
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movie.productionCountries!
                        .map(
                          (e) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                e.name ?? 'Original Language',
                                textAlign: TextAlign.start,
                              ),
                              const Icon(
                                  IconData(10, matchTextDirection: true)),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Companies',
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movie.productionCompanies!
                        .map(
                          (e) => Text(
                            e.name ?? 'Original Language',
                            textAlign: TextAlign.start,
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: Text('Budget')),
                Expanded(child: Text(movie.budget?.toString() ?? 'Budget'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: Text('Revenue')),
                Expanded(child: Text(movie.revenue?.toString() ?? 'Budget'))
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
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
