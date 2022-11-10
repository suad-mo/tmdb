import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/person_detail_header_widget.dart';
import 'widgets/tabs/about_tab_widget.dart';
// import 'package:tmdb/screens/movie/tabs/about_tab.dart';
// import 'package:tmdb/core/zz.dart';

import '../../../dependensi_injection/get_it.dart';
import '../domain/entities/person_detail_entyty.dart';
import 'blocs/person_detail_bloc/person_detail_bloc.dart';

class PersonDetailScreen extends StatelessWidget {
  final int id;
  final String name;
  final String? profilePath;
  final PersonDetailBloc bloc;

  PersonDetailScreen(
      {super.key, required this.id, required this.name, this.profilePath})
      : bloc = getIt.get<PersonDetailBloc>()
          ..add(GetPersonDetailByIdEvent(id: id));

  static Route<void> route(int id, String name, String? profilePath) {
    return MaterialPageRoute<void>(
      builder: (_) => PersonDetailScreen(
        id: id,
        name: name,
        profilePath: profilePath,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final title = 'Actor...';
    //context.read<PersonDetailBloc>().stream.first.toString();

    return BlocBuilder<PersonDetailBloc, PersonDetailState>(
        bloc: bloc,
        builder: (context, state) {
          PersonDetailEntity? person;
          if (state is PersonDetailLoadingState) {
            return const Center(
              child: Text('Loading....'),
            );
          } else if (state is PersonDetailErrorState) {
            return const Center(
              child: Text('Error....'),
            );
          } else if (state is PersonDetailLoadedState) {
            person = state.personDetailEntity;
          }
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    title: Text(name),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    expandedHeight: 350,
                    stretch: true,
                    pinned: true,
                    actionsIconTheme: const IconThemeData(
                        shadows: [Shadow(color: Colors.green)]),
                    flexibleSpace: FlexibleSpaceBar(
                      background: person != null
                          ? PersonDetailHeaderWidget(person: person)
                          : null,
                      centerTitle: true,
                      // title: Text(
                      //   name,
                      //   style: const TextStyle(color: Colors.black),
                      // ),
                      // expandedTitleScale: 1,
                      // titlePadding: const EdgeInsets.only(bottom: 35, top: 0),
                      stretchModes: const [
                        StretchMode.fadeTitle,
                        // StretchMode.blurBackground
                      ],
                      collapseMode: CollapseMode.pin,
                    ),
                    floating: false,
                    // leading: Container(
                    //   margin: const EdgeInsets.all(6),
                    //   child: Ink(
                    //     decoration: const ShapeDecoration(
                    //       color: Colors.black26,
                    //       shape: CircleBorder(),
                    //     ),
                    //     child: IconButton(
                    //       icon: const Icon(
                    //         Icons.arrow_back,
                    //         color: Colors.white,
                    //       ),
                    //       iconSize: 24,
                    //       onPressed: (() {
                    //         Navigator.of(context).pop();
                    //       }),
                    //     ),
                    //   ),
                    // ),
                    bottom: const TabBar(
                      labelColor: Colors.blue,
                      indicatorColor: Colors.blue,
                      padding: EdgeInsets.all(0),
                      tabs: [
                        Tab(
                          child: Text(
                            'About',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Movies',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Tv Show',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate(<Widget>[
                    Container(
                      padding: const EdgeInsets.all(0),
                      height: 1850,
                      child: TabBarView(
                        children: [
                          person != null
                              ? AboutTabWidget(
                                  person: person,
                                )
                              : Container(),
                          Container(
                            color: Colors.amber,
                          ),
                          Container(
                            color: Colors.green,
                          )
                        ],
                      ),
                    )
                  ]))
                ],
              ),

              // appBar: AppBar(
              //   backgroundColor: Colors.white,
              //   foregroundColor: Colors.black,
              //   elevation: 0,
              //   title: Text(name),
              //   bottom: const TabBar(tabs: [
              //     Text(
              //       'Child-1',
              //       style: TextStyle(color: Colors.black),
              //     ),
              //     Text(
              //       'Child-2',
              //       style: TextStyle(color: Colors.black),
              //     ),
              //     Text(
              //       'Child-3',
              //       style: TextStyle(color: Colors.black),
              //     ),
              //   ]),
              // ),
              // body: const Center(
              //   child: Text('AAAAA...'),
              // ),
              // BlocBuilder(
              //   bloc: bloc,
              //   builder: (context, state) {
              // if (state is PersonDetailLoadedState) {
              //   final person = state.personDetailEntity;
              //  return  Center(
              //     child: CircleAvatar(
              //       radius: 60,
              // backgroundImage: profilePath != null
              //     ? NetworkImage(
              //         'https://image.tmdb.org/t/p/w185/$profilePath',
              //         scale: 2)
              //     : null,
              //     ), // Text(person.toString()),
              //   );
              // } else if (state is PersonDetailLoadingState) {
              //    style: TextStyle(color: Colors.black),
              // } else if (state is PersonDetailErrorState) {
              //    const Center(
              //     child: Text('Somthing error...'),
              //   );
              // }

              //  const Center(
              //   child: Text('No name state...'),
              // );
              // },
            ),
          );
        });
  }
}
