import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/services.dart';

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
          IconButton(onPressed: (() {}), icon: const Icon(Icons.share)),
          IconButton(onPressed: (() {}), icon: const Icon(Icons.download)),
        ],
        // systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarOpacity: 0.8,
      ),
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
          index: _currentIndex,
          loop: false, //
        ),
      ),
    );
  }
}
