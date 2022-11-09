import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dependensi_injection/get_it.dart';
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
    final title = 'Actor...';
    //context.read<PersonDetailBloc>().stream.first.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(name),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is PersonDetailLoadedState) {
            final person = state.personDetailEntity;
            return Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: profilePath != null
                    ? NetworkImage(
                        'https://image.tmdb.org/t/p/w185/$profilePath',
                        scale: 2)
                    : null,
              ), // Text(person.toString()),
            );
          } else if (state is PersonDetailLoadingState) {
            return const Center(
              child: Text('Loading...'),
            );
          } else if (state is PersonDetailErrorState) {
            return const Center(
              child: Text('Somthing error...'),
            );
          }

          return const Center(
            child: Text('No name state...'),
          );
        },
      ),
    );
  }
}
