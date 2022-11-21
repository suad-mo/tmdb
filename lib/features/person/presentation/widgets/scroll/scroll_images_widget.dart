import 'package:flutter/material.dart';
import 'package:tmdb/configuration.dart';
import 'package:tmdb/core/domain/entities/image_entity.dart';

import '../../../../../screens/poster_screen.dart';

class ScrollImagesWidget extends StatelessWidget {
  // final List<String> images;
  final List<ImageEntity> images;

  const ScrollImagesWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar(
        //   titleSpacing: 0,
        //   toolbarHeight: 0,
        //   excludeHeaderSemantics: true,
        //   elevation: 0,
        //   title: const Text(
        //     'Images',
        //     style: TextStyle(
        //       fontSize: 20,
        //       color: Colors.black,
        //     ),
        //   ),
        //   backgroundColor: Colors.white,
        //   automaticallyImplyLeading: false,
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         final arg = images
        //             .map((e) => '${TMDB.urlOriginal}${e.filePath!}')
        //             .toList();

        //         Navigator.of(context)
        //             .pushNamed(PosterScreen.routeName, arguments: arg);
        //       },
        //       icon: const Icon(Icons.arrow_forward),
        //       color: Colors.black,
        //     ),
        //   ],
        // ),
        ListTile(
          title: const Text('Images'),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          trailing: IconButton(
            onPressed: () {
              final arg = images
                  .map((e) => '${TMDB.urlOriginal}${e.filePath!}')
                  .toList();

              Navigator.of(context)
                  .pushNamed(PosterScreen.routeName, arguments: arg);
            },
            icon: const Icon(Icons.arrow_forward),
            color: Colors.black,
          ),
        ),
        Container(
          width: double.infinity,
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: ((_, i) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  width: 110,
                  child: InkWell(
                    onTap: (() {
                      final arg = <String>[
                        '${TMDB.urlOriginal}${images[i].filePath!}',
                      ];
                      Navigator.of(context)
                          .pushNamed(PosterScreen.routeName, arguments: arg);
                    }),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: images[i].filePath != null
                            ? Image(
                                image: NetworkImage(
                                    '${TMDB.https}${images[i].filePath!}'),
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child,
                                        loadingProgress) =>
                                    loadingProgress == null
                                        ? child
                                        : const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                              )
                            : const Center(
                                child: Text('Error'),
                              )),
                  ),
                );
              })),
        ),
        // ListTile(
        //   title: const Text('Images'),
        //   contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        //   trailing: IconButton(
        //     onPressed: () {
        //       final arg = images
        //           .map((e) => '${TMDB.urlOriginal}${e.filePath!}')
        //           .toList();

        //       Navigator.of(context)
        //           .pushNamed(PosterScreen.routeName, arguments: arg);
        //     },
        //     icon: const Icon(Icons.arrow_forward),
        //     color: Colors.black,
        //   ),
        // ),
      ],
    );
  }
}
