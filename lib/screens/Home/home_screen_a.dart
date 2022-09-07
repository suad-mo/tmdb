import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/media_provider.dart';

class HomeScreenA extends StatelessWidget {
  const HomeScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<MediaProvider>(context, listen: false);
    p.initTrendingMovie();
    final tr = p.trendingMovie;
    return Scaffold(
      appBar: AppBar(title: const Text('Media App')),
      body: Consumer<MediaProvider>(
        builder: (context, value, child) {
          final trend = value.trendingMovie.isInit;
          return Center(
            child: Text(
                'Init Provider: ${value.isInit.toString()} Init Trending: ${tr.isInit.toString()}'),
          );
        },
      ),
    );
  }
}
