import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tmdb/configuration.dart';
import 'package:tmdb/helpers/tmbd_res_data.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/widgets/Swiper/swiper_header.dart';
import 'package:tmdb/widgets/cast/cast_list.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader(this.movie, {super.key});
  final Movie movie;

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
    return TMDB.https + movie.posterPath!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SwiperHeader(backdrops),
                  Container(
                    height: 80,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 180,
                              child: Text(
                                movie.title!,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Text(
                                '${movie.releaseDate} . ${movie.runtime.toString()} mins'),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.black12,
                            padding: EdgeInsets.all(10),
                            width: 48,
                            height: 48,
                            // child: Image(
                            //   image: NetworkImage(
                            //       'https://www.themoviedb.org/assets/2/v4/logos/v2/blue_square_2-d537fb228cf3ded904ef09b136fe3fec72548ebc1fea3fbbd1ad9e36364db38b.svg'),
                            //   fit: BoxFit.cover,
                            // ),

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
                              padding: EdgeInsets.all(5),
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
                          'Rate this movie',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 120,
                left: 12,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    width: 124,
                    height: 180,
                    image: NetworkImage(posterPath),
                    fit: BoxFit.cover,
                    // color: Colors.red,
                    // colorBlendMode: BlendMode.darken,
                    //frameBuilder: ((context, child, frame, wasSynchronouslyLoaded) => wasSynchronouslyLoaded),
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ],
          ),
          // CastList(
          //   movie.id!,
          //   typeMedia: TypeMedia.movie,
          // )
        ],
      ),
    );
  }
}
