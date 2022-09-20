import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PosterScreen extends StatefulWidget {
  const PosterScreen({Key? key}) : super(key: key);
  static String routeName = '/posters';

  @override
  State<PosterScreen> createState() => _PosterScreenState();
}

class _PosterScreenState extends State<PosterScreen> {
  int _currentIndex = 0;
  bool _full = false;
  @override
  Widget build(BuildContext context) {
    final posters = ModalRoute.of(context)?.settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(
        title: Text('${_currentIndex + 1}/${posters.length}'),
        // toolbarOpacity: 0.9,
        backgroundColor: Colors.black12,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (() {
                setState(() {
                  _full = !_full;
                });
              }),
              icon: Icon(_full ? Icons.close_fullscreen : Icons.open_in_full)),
          IconButton(onPressed: (() {}), icon: Icon(Icons.share)),
          IconButton(onPressed: (() {}), icon: Icon(Icons.download)),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarOpacity: 0.8,
      ),
      // extendBody: true,
      extendBodyBehindAppBar: _full ? true : false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Swiper(
          itemCount: posters.length,
          itemBuilder: (context, i) => Image.network(
            'https://image.tmdb.org/t/p/w500${posters[i]}', //w500
            fit: _full ? BoxFit.cover : BoxFit.contain,
          ),
          onIndexChanged: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          loop: false, //
        ),
      ),
      // body: CustomScrollView(slivers: [
      //   SliverAppBar(
      //     backgroundColor: Colors.black12,
      //     // floating: true,
      //     // snap: true,
      //     pinned: true,
      //     title: Text('$_currentIndex/${posters.length}'),
      //     actions: [
      //       IconButton(
      //           onPressed: (() {
      //             setState(() {
      //               _full = !_full;
      //             });
      //           }),
      //           icon:
      //               Icon(_full ? Icons.open_in_full : Icons.close_fullscreen)),
      //       IconButton(onPressed: (() {}), icon: Icon(Icons.share)),
      //       IconButton(onPressed: (() {}), icon: Icon(Icons.download)),
      //     ],
      //     stretch: true,
      //   ),
      //   SliverList(
      //     delegate: SliverChildListDelegate(
      //       [
      // Container(
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      //   child: Swiper(
      //     itemCount: posters.length,
      //     itemBuilder: (context, i) => Image.network(
      //       'https://image.tmdb.org/t/p/w342${posters[i]}', //w500
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // )
      //       ],
      //     ),
      //   ),
      // ]),
    );
  }
}


 // Swiper(
        //   itemCount: posters.length,
        //   itemBuilder: (context, index) {
        //     return Image.network(
        //       'https://image.tmdb.org/t/p/w342${posters[index]}', //w500
        //       fit: BoxFit.fill,
        //     );
        //   },
        //   onIndexChanged: ((value) {
        //     setState(() {
        //       _currentIndex = value + 1;
        //     });
        //   }),
        // ),