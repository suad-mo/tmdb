import 'package:flutter/material.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../../screens/movie/movie_screen.dart';

class GridMoviesWidget extends StatelessWidget {
  const GridMoviesWidget({super.key, required this.items});

  final List<MovieEntity> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.67,
        crossAxisSpacing: 3,
        // mainAxisSpacing: 3,
      ),
      itemCount: items.length,
      // findChildIndexCallback: (key) {
      //   print('aa...');
      //   return null;
      // },
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.only(top: 6.0, left: 6.0, right: 6.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            maintainState: false,
                            builder: (context) {
                              return MovieScreen(items[index].id.toInt());
                            },
                          ),
                        );
                      },
                      child: Image(
                        image: NetworkImage(items[index].posterPath),
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) =>
                            loadingProgress == null
                                ? child
                                : const Center(
                                    child: CircularProgressIndicator()),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      top: 8,
                      child: Text(
                        items[index].voteAverage.toStringAsFixed(1),
                        style: const TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.black12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
