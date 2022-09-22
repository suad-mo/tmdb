import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import '../models/item_media.dart';
import 'movie/movie_screen.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({Key? key}) : super(key: key);
  static const routeName = '/media-screen';

  @override
  Widget build(BuildContext context) {
    final items = ModalRoute.of(context)?.settings.arguments as List<ItemMedia>;
    // items[i].
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        // excludeHeaderSemantics: true,
        // flexibleSpace: Text('Fleksibile space...'),
        title: const Text('title'),
        foregroundColor: Colors.black,
        // scrolledUnderElevation: 100,
        // scrolledUnderElevation: 100,
        // systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: ((_, i) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        maintainState: false,
                        builder: (context) {
                          return MovieScreen(items[i].id.toInt());
                        },
                      ));
                },
                child: Container(
                  height: 220,
                  padding: const EdgeInsets.all(10),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image(
                            image: NetworkImage(items[i].posterPath, scale: 1),
                          ),
                          Positioned(
                            left: 100,
                            top: 8,
                            child: Text(
                              items[i].voteAverage.toStringAsFixed(1),
                              style: const TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.black12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // padding: EdgeInsets.all(5),
                      // width: (MediaQuery.of(context).size.width / 2) - 40,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[i].title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                            Text(
                              items[i]
                                  .genres
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                            ),
                          ],
                        ),
                      ),
                    )
                    // Container(
                    //   // child: ListTile(
                    //   //   title:
                    //   child: ListTile(title: Text(items[i].title)),
                    //   // leading:
                    // ),
                  ]),
                ),
              )),
        ),
      ),
    );
  }
}

// Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Container(
//             width: (MediaQuery.of(context).size.width / 2) - 40,
//             // height: (MediaQuery.of(context).size.height / 3) - 60,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
// child: Image(
//   image: NetworkImage(items[i].posterPath, scale: 1),
// ),
//             ),
//           ),
//           Column(
//             children: [
//               // ListTile(
//               //   title: Text(items[i].title),
//               // ),
//               Text(
//                 items[i].title,
//                 maxLines: 3,
//                 overflow: TextOverflow.clip,
//                 softWrap: true,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ))
