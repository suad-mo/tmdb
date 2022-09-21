import 'package:flutter/material.dart';

import '../../screens/movie/movie_screen.dart';
import '../../models/item_media.dart';

class ItemHorizontalScroll extends StatelessWidget {
  const ItemHorizontalScroll(
    this.item, {
    Key? key,
    this.typeMedia = "MOVIE",
  }) : super(key: key);
  final ItemMedia item;
  final String typeMedia;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: 120,
      color: Colors.white,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          maintainState: false,
                          builder: (context) {
                            return MovieScreen(item.id.toInt());
                          },
                        ));
                  },
                  child: Image(
                    image: NetworkImage(item.posterPath),
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : const Center(child: CircularProgressIndicator()),
                  ),
                ),
                Positioned(
                  left: 90,
                  top: 8,
                  child: Text(
                    item.voteAverage.toStringAsFixed(1),
                    style: const TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 90,
                child: Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              ),
              GestureDetector(
                onTap: (() {
                  //print('aaaa');
                }),
                child: const Icon(
                  Icons.more_vert,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
