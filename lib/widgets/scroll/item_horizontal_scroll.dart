import 'package:flutter/material.dart';

import '../../models/item_media.dart';

class ItemHorizontalScrol extends StatelessWidget {
  const ItemHorizontalScrol(this.item, {Key? key}) : super(key: key);
  final ItemMedia item;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: 120,
        //color: Colors.green,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: NetworkImage(item.posterPath),
            fit: BoxFit.cover,
          ),
        )
        // Card(
        // child: Image(
        //   image: NetworkImage(item.posterPath),
        //   fit: BoxFit.cover,
        // ),
        //   elevation: 0,
        //   borderOnForeground: false,
        // ),
        // Column(
        //   children: [
        //     Image(
        //       image: NetworkImage(item.posterPath),
        //       fit: BoxFit.cover,
        //     ),
        //     Text(item.title),
        //   ],
        // ),
        );
  }
}
