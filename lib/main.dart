import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/screens/movie/movie_screen.dart';

import '../providers/media_provider.dart';
import '../screens/home/home_screen.dart';
import 'providers/movie_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MediaProvider>(
          create: (_) => MediaProvider(),
        ),
        ChangeNotifierProvider<MovieProvider>(
          create: (_) => MovieProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: {
          MovieScreen.routeName: (ctx) => const MovieScreen(),
        },
      ),
    );
  }
}
