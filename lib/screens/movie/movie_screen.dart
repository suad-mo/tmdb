import 'package:flutter/material.dart';
import 'package:tmdb/configuration.dart';

import '../../helpers/tmbd_res_data.dart';
import '../../models/movie.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);
  static const routeName = '/movie';
  // final int id;

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  Movie? _movie;

  //Može i bez ove provjere jer koristi -lete- ključnu riječ ispred promjenjivih
  // ignore: prefer_final_fields
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final id = ModalRoute.of(context)?.settings.arguments as int;
      TmdbData.getMovie(id).then((movie) {
        setState(() {
          _movie = movie;
          _loadedInitData = true;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _movie == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(title: Text(_movie!.title!)),
            body: Container(
              width: double.infinity,
              height: 250,
              child: ListView.builder(
                // controller: _controller,
                scrollDirection: Axis.horizontal,
                addAutomaticKeepAlives: true,
                shrinkWrap: true,
                itemCount: _movie?.images?.backdrops?.length,
                itemBuilder: (context, index) => Image(
                  image: NetworkImage(TMDB.urlBack +
                      _movie!.images!.backdrops![index].filePath!),
                  fit: BoxFit.cover,
                ),

                // child: PageView.builder( itemCount: _movie!.images!.backdrops!.length ,itemBuilder: ((context, index) => Image(
                //       image: NetworkImage(TMDB.urlBack + _movie!.images!.backdrops![index].filePath!),
                //       fit: BoxFit.cover,)),
                // child: Column(children: <Widget>[

                // ]),
              ),
            ));
  }
}
