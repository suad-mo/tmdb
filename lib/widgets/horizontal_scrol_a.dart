import 'package:flutter/material.dart';

import '../providers/media_for_scroll_list.dart';
import '../models/info_list_tmdb.dart';

class HorizontalScrolA extends StatelessWidget {
  HorizontalScrolA(this.typeListMedia, {Key? key}) : super(key: key) {
    mediaForScrollList = MediaForScrollList(typeListMedia);
  }
  final TypeListMedia typeListMedia;
  late MediaForScrollList mediaForScrollList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResultMediaScrolList>(
      future: mediaForScrollList.mediaScroll,
      builder: (context, snapshot) => !snapshot.hasData
          ? const CircularProgressIndicator()
          : Column(
              children: [
                AppBar(
                  title: Text(InfoListTmdb.setByType(typeListMedia).title),
                  backgroundColor: Theme.of(context).primaryColor,
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      onPressed: (() {}),
                      icon: const Icon(Icons.forward),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 180,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: RefreshIndicator(
                    edgeOffset: 20,
                    color: Colors.yellow,
                    onRefresh: (() {
                      return mediaForScrollList.nextMediaScroll(true);
                    }),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: mediaForScrollList.items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: 100,
                            color: Colors.green,
                            child: Image(
                              image: NetworkImage(
                                  mediaForScrollList.items[index].posterPath),
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
    );
  }
}
