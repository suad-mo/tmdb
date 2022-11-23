import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependensi_injection/get_it.dart';
import '../blocs/person_detail_bloc/person_detail_bloc.dart';

class PersonDetailView extends StatelessWidget {
  final int id;
  final String name;
  final String? profilePath;
  final PersonDetailBloc bloc;

  PersonDetailView({
    super.key,
    required this.id,
    required this.name,
    required this.profilePath,
    PersonDetailBloc? newBloc,
  }) : bloc = newBloc ?? getIt.get<PersonDetailBloc>(instanceName: 'person$id')
          ..add(GetPersonDetailByIdEvent(id: id));

  static Route<void> route(int id, String name, String? profilePath) {
    return MaterialPageRoute<void>(
      builder: (_) {
        final String instanceName = 'person_$id';
        PersonDetailBloc? bloc;
        final isRedy =
            getIt.isReadySync<PersonDetailBloc>(instanceName: instanceName);
        if (isRedy) {
          bloc = getIt.get<PersonDetailBloc>(instanceName: instanceName);
        } else {
          bloc = getIt.get<PersonDetailBloc>(instanceName: instanceName)
            ..add(GetPersonDetailByIdEvent(id: id));
        }
        return PersonDetailView(
          id: id,
          name: name,
          profilePath: profilePath,
          newBloc: bloc,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
