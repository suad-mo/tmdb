import 'package:flutter/material.dart';
import 'package:tmdb/features/person/domain/entities/person_base_entity.dart';
import 'package:tmdb/features/person/presentation/person_detail_screen.dart';

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
            itemBuilder: (context, i) => InkWell(
              onTap: () {
                final id = list[i].id;
                final name = list[i].name ?? 'No Name';
                final profilePath = list[i].profilePath;
                // final person = list[i] as PersonBaseEntity;
                id != null
                    ? Navigator.push(context,
                        PersonDetailScreen.route(id, name, profilePath))
                    : null;
              },
              child: ListTile(
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
            ),
          );
          // ],

        }
        return const Center(child: CircleAvatar());
      }),
    );
  }
}
