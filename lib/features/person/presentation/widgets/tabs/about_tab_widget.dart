import 'package:flutter/material.dart';

import '../../../domain/entities/person_detail_entyty.dart';

class AboutTabWidget extends StatefulWidget {
  const AboutTabWidget({super.key, required this.person});

  final PersonDetailEntity person;

  @override
  State<AboutTabWidget> createState() => _AboutTabWidgetState();
}

class _AboutTabWidgetState extends State<AboutTabWidget> {
  bool less = true;
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Age',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 15),
                Text(
                  widget.person.age.toString(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Born on',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 15),
                Text(
                  widget.person.birthday.toString(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Biography',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            // less
            //     ?
            Text(
              widget.person.biography ?? 'Biography',
              textAlign: TextAlign.left,
              maxLines: less ? 3 : null,
              overflow: less ? TextOverflow.ellipsis : null,
              softWrap: less ? false : null,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            // : Text(
            //     widget.person.biography ?? 'Biography',
            //     textAlign: TextAlign.left,
            //   ),
            TextButton(
              onPressed: (() {
                setState(() {
                  less = !less;
                  _controller.initialScrollOffset; //= true;
                });
              }),
              child: Text(less ? 'Read more' : 'Read less'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Also known as',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.person.alsoKnownAs?.length ?? 0,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black12,
                      ),
                      onPressed: (() {
                        //   final id = movie.genres?[index].id;
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => MoviesWidthTypeScreen.withGenre(
                        //         movieGenres: MovieGenres.getWithId(id!),
                        //         // instanceName: widget.instanceName,
                        //       ),
                        //     ),
                        //   );
                      }),
                      child: Text(
                        widget.person.alsoKnownAs?[index] ?? '',
                        style: const TextStyle(
                          // background: Paint()..color,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
