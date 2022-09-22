import 'package:flutter/material.dart';

import '../models/item_media.dart';
import 'movie/movie_screen.dart';

class ListMediaScreen extends StatelessWidget {
  const ListMediaScreen({super.key});
  static const routeName = '/list-media-screen';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as dynamic;
    final items = data != null
        ? data['items'] as List<ItemMedia>
        : <ItemMedia>[]; // as List<ItemMedia>;
    final title = data != null ? data['title'].toString() : 'Title';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            // stretch: true,
            expandedHeight: null,
            forceElevated: true,
            // collapsedHeight: 58,
            snap: true,
            bottom: null,
            elevation: 0,
            floating: true,
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text(
              title,
              style: const TextStyle(color: Colors.black87),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
              const SizedBox(
                width: 12,
              )
            ],

            // flexibleSpace: FlexibleSpaceBar(h ),
          ),
          buildList(items),
        ],
      ),
    );
  }

  Widget buildList(List<ItemMedia> items) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        // addAutomaticKeepAlives: false,
        // addRepaintBoundaries: false,
        // scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: ((ctx, i) => InkWell(
              onTap: () {
                Navigator.push(
                    ctx,
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
                            items[i].releaseDate.substring(0, 4),
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                ]),
              ),
            )),
      ),
    );
  }
}
