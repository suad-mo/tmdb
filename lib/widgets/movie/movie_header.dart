import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../configuration.dart';
import '../../models/movie.dart';
import '../../screens/poster_screen.dart';
import '../../widgets/swiper/swiper_header.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader(this.movie, {super.key});
  final Movie movie;

  String? get date {
    final DateFormat x = DateFormat.yMMM();
    if (movie.releaseDate != null && movie.releaseDate!.isNotEmpty) {
      return x.format(DateTime.parse(movie.releaseDate!));
    }
    return null;
  }

  List<String> get backdrops {
    List<String> backdropsList = <String>[];
    final backdrops = movie.images!.backdrops;
    if (backdrops != null) {
      for (var i = 0;
          i < (backdrops.length > 10 ? 10 : backdrops.length);
          i++) {
        final path = backdrops[i].filePath;
        if (path != null) {
          backdropsList.add(path);
        }
      }
    }
    return backdropsList;
  }

  String get posterPath {
    return '${TMDB.https}${movie.posterPath ?? '/ugiL6wIhl1OfPyv1gqLkTe45jLl.jpg'}';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SwiperHeader(backdrops),
                  SizedBox(
                    height: 80,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 150,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 180,
                              child: Text(
                                movie.title!,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                // Text('$date . ${movie.runtime.toString()} mins'),
                                Text(date ?? ''),
                                const Text(' - '),
                                // const Icon(Icons.abc_sharp, size: 14),
                                Text('${movie.runtime.toString()} mins'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.black12,
                            padding: const EdgeInsets.all(10),
                            width: 48,
                            height: 48,
                            child: SvgPicture.network(
                              'https://www.themoviedb.org/assets/2/v4/logos/v2/blue_square_2-d537fb228cf3ded904ef09b136fe3fec72548ebc1fea3fbbd1ad9e36364db38b.svg',
                              color: Colors.blue,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            '${(movie.voteAverage! * 10).toStringAsFixed(0)}%',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(movie.voteCount!.toString()),
                              const Icon(
                                Icons.group,
                                size: 16,
                                color: Colors.black45,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 50),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                              color: Colors.black12,
                              padding: const EdgeInsets.all(5),
                              width: 48,
                              height: 48,
                              child: const Icon(
                                Icons.add,
                                size: 24,
                              )),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Rate movie',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 120,
                left: 12,
                child: InkWell(
                  onTap: () {
                    final data = movie.images?.posters;
                    if (data != null || data!.isEmpty) {
                      final enPosters =
                          data.where((e) => e.iso6391 == 'en').toList();
                      final arg = enPosters.map((image) {
                        return image.filePath!;
                      }).toList();
                      Navigator.of(context)
                          .pushNamed(PosterScreen.routeName, arguments: arg);
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      width: 124,
                      height: 180,
                      image: NetworkImage(posterPath),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const Center(
                                  child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
