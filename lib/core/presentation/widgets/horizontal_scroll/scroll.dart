import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tmdb/core/domain/entities/movie_entity.dart';
import 'package:tmdb/core/presentation/widgets/horizontal_scroll/item_scroll.dart';

import '../../blocs/list_movies/list_movies_bloc.dart';

class Scroll extends StatelessWidget {
  const Scroll({super.key, required this.items, required this.update});

  // final ListMoviesBloc bloc;
  final List<MovieEntity> items;
  final VoidCallback update;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          title: const Text('Title Movie'),
          actions: [
            IconButton(onPressed: update, icon: const Icon(Icons.arrow_forward))
          ],
        ),
        Container(
          width: double.infinity,
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: ListView.builder(
            // controller: _controller,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) => ItemScroll(
              item: items[index],
            ),
          ),
        ),
      ],
    );
  }
}
