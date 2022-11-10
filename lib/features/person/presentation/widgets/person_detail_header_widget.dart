import 'package:flutter/material.dart';
import '../../../../configuration.dart';
import '../../domain/entities/person_detail_entyty.dart';

class PersonDetailHeaderWidget extends StatelessWidget {
  const PersonDetailHeaderWidget({super.key, required this.person});

  final PersonDetailEntity person;

  String get profilePath {
    return '${TMDB.https}${person.profilePath ?? '/ugiL6wIhl1OfPyv1gqLkTe45jLl.jpg'}';
  }

  // final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: Column(children: <Widget>[
        Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    profilePath,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  person.name,
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  person.knownForDepartment ?? 'Person',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
