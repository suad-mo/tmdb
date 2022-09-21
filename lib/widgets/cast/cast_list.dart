import 'package:flutter/material.dart';

import 'package:tmdb/helpers/tmbd_res_data.dart';
import 'package:tmdb/models/credits/cast.dart';

class CastList extends StatelessWidget {
  const CastList(this.id, {this.typeMedia = TypeMedia.movie, super.key});
  final int id;
  final String typeMedia;

  Future<List<Cast>> _future() {
    return TmdbData.getMovieCast(id, typeMedia);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cast>>(
      future: _future(),
      builder: ((context, AsyncSnapshot<List<Cast>> data) {
        final list = data.data;
        if (list != null) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: (context, i) => ListTile(
              title: Text(list[i].name!),
              leading: CircleAvatar(
                foregroundColor: Colors.amber,
                backgroundColor: Colors.amberAccent,
                backgroundImage: list[i].profilePath != null
                    ? NetworkImage(
                        'https://image.tmdb.org/t/p/w45/${list[i].profilePath!}')
                    : null,
              ),
            ),
          );
          // ],

        }
        return const Center(child: CircleAvatar());
      }),
    );
  }
}
