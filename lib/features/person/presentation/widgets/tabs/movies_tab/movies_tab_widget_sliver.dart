import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/configuration.dart';

import '../../../../../../dependensi_injection/get_it.dart';
import '../../../../../../screens/movie/movie_screen.dart';
import '../../../blocs/person_movie_cast/person_movie_cast_bloc.dart';

class MovieTabSliverWidget extends StatelessWidget {
  final int id;
  // final List<MovieCastEntity> movieCast;
  final PersonMovieCastBloc bloc;

  MovieTabSliverWidget({
    super.key,
    required this.id,
  }) : bloc = getIt.get<PersonMovieCastBloc>()
          ..add(GetPersonMovieCastByIdEvent(id: id));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonMovieCastBloc, PersonMovieCastState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is PersonMovieCastLoadedState) {
          final movieCast = state.movieCast;
          return CustomScrollView(
              key: PageStorageKey<int>(id),
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: Row(
                    children: <Widget>[
                      Text(
                        '${movieCast.length}  movies',
                        style: TextStyle(color: Colors.blue[700]),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      TextButton.icon(
                        onPressed: (() {}),
                        icon: const Icon(Icons.menu),
                        label: const Text('View'),
                      ),
                      TextButton.icon(
                        onPressed: (() {}),
                        icon: const Icon(Icons.sort),
                        label: const Text('Sort'),
                      ),
                    ],
                  ),
                ),
                // SliverPadding(
                //   padding: const EdgeInsets.all(8),
                //   sliver:
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              maintainState: false,
                              builder: (context) {
                                return MovieScreen(movieCast[index].id.toInt());
                              },
                            ),
                          );
                        },
                        child: GridTile(
                          child: movieCast[index].posterPath != null
                              ? Image(
                                  image: NetworkImage(
                                      '${TMDB.https}${movieCast[index].posterPath!}'),
                                )
                              : Center(child: Text(movieCast[index].title)),
                        ),
                      ),
                    ),
                  ),
                ),
                // ),
              ]);
          //   GridView.builder(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 3,
          //         childAspectRatio: 0.67,
          //         crossAxisSpacing: 8,
          //         mainAxisSpacing: 5),
          //     itemCount: movieCast.length,
          //     physics: const ScrollPhysics(),
          //     shrinkWrap: true,
          //     padding: const EdgeInsets.all(0),
          //     scrollDirection: Axis.vertical,
          //     itemBuilder: ((context, index) => ClipRRect(
          //           borderRadius: BorderRadius.circular(10),
          //           child: InkWell(
          //             onTap: () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   maintainState: false,
          //                   builder: (context) {
          //                     return MovieScreen(
          //                         movieCast[index].id.toInt());
          //                   },
          //                 ),
          //               );
          //             },
          //             child: GridTile(
          //               child: movieCast[index].posterPath != null
          //                   ? Image(
          //                       image: NetworkImage(
          //                           '${TMDB.https}${movieCast[index].posterPath!}'),
          //                     )
          //                   : Center(child: Text(movieCast[index].title)),
          //             ),
          //           ),
          //         )),
          //   ),
          // ],
          //   ),
          // );
          // //  Column(children: <Widget>[
          // Row(
          //   children: <Widget>[
          //     Text('${movieCast.length}  movies'),
          //     const Expanded(
          //       child: SizedBox(),
          //     ),
          //     // const Text('View'),
          //     // IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          //     const Icon(Icons.border_vertical),
          //     TextButton.icon(
          //       onPressed: (() {}),
          //       icon: const Icon(Icons.menu),
          //       label: const Text('View'),
          //     ),
          //     TextButton.icon(
          //       onPressed: (() {}),
          //       icon: const Icon(Icons.sort),
          //       // style: ButtonStyle(alignment: Alignment.centerRight),
          //       style: ButtonStyle(),
          //       label: const Text('Sort'),
          //     ),
          //   ],
          // ),
          //   const SizedBox(
          //     height: 45,
          //     child: Text('data'),
          //   ),
          //   GridView.builder(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 3,
          //       childAspectRatio: 0.67,
          //       crossAxisSpacing: 3,

          //     ),
          //     itemCount: movieCast.length,
          //     scrollDirection: Axis.vertical,
          //     itemBuilder: ((context, index) => Padding(
          //           padding: const EdgeInsets.only(
          //               top: 6.0, left: 6.0, right: 6.0),
          //           child: GridTile(
          //             child: Image(
          //               image: NetworkImage(movieCast[index].posterPath!),
          //             ),
          //           ),
          //         )),
          //   ),
          // ]);
        } else {
          return const Center(
            child: Text('Loading or Reeor...'),
          );
        }
      },
    );
  }
}
