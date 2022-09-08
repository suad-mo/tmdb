// import 'package:flutter/material.dart';
// import 'package:tmdb/providers/media_for_scroll_list.dart';

// import '../models/info_list_tmdb.dart';

// import '../models/info_list_tmdb.dart';

// class HorizontalScrol extends StatelessWidget {
//   HorizontalScrol(this.typeListMedia, {Key? key}) : super(key: key) {
//     media = MediaForScrollList(typeListMedia);
//   }
//   final TypeListMedia typeListMedia;
//   late MediaForScrollList media;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<MediaForScrollList>(
//       future: media.mediaScroll,
//       //initialData: [],
//       builder: (context, snapshot) => !snapshot.hasData
//           ? const CircularProgressIndicator()
//           : Column(
//               children: [
//                 AppBar(
//                   title: Text(InfoListTmdb.setByType(typeListMedia).title),
//                   backgroundColor: Theme.of(context).primaryColor,
//                   automaticallyImplyLeading: false,
//                   actions: [
//                     IconButton(
//                       onPressed: (() {}),
//                       icon: const Icon(Icons.forward),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 180,
//                   margin: const EdgeInsets.symmetric(horizontal: 5),
//                   child: RefreshIndicator(
//                     edgeOffset: 20,
//                     color: Colors.yellow,
//                     onRefresh: () => media.nextMediaScroll(false),
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       shrinkWrap: true,
//                       itemCount: snapshot.data!.items.length,
//                       itemBuilder: (context, index) => Container(
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 10),
//                         width: 100,
//                         color: Colors.green,
//                         child: Image(
//                           image: NetworkImage(
//                               snapshot.data!.items[index].posterPath),
//                           fit: BoxFit.cover,
//                         ),
//                         // child: Text(popularMovie[index].title),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
