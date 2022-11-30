import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../configuration.dart';
import '../../../../../../dependensi_injection/get_it.dart';
import '../../../blocs/person_tv_cast/person_tv_cast_bloc.dart';

class TvsTabWidget extends StatelessWidget {
  final int id;
  final PersonTvCastBloc bloc;
  TvsTabWidget({super.key, required this.id})
      : bloc = getIt.get<PersonTvCastBloc>()
          ..add(GetPersonTvCastByIdEvent(id: id));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonTvCastBloc, PersonTvCastState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is PersonTvCastLoadedState) {
          final tvCast = state.tvCast;
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      '${tvCast.length}  movies',
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
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.67,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 5),
                  itemCount: tvCast.length,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  itemBuilder: ((context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     maintainState: false,
                            //     builder: (context) {
                            //       return MovieScreen(
                            //           movieCast[index].id.toInt());
                            //     },
                            //   ),
                            // );
                          },
                          child: GridTile(
                            child: tvCast[index].posterPath != null
                                ? Image(
                                    image: NetworkImage(
                                        '${TMDB.https}${tvCast[index].posterPath!}'),
                                  )
                                : Center(child: Text(tvCast[index].name)),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('Loading or Reeor...'),
          );
        }
      },
    );
  }
}
