import 'package:flutter/material.dart';

import 'dependensi_injection/get_it.dart';
import 'core/presentation/home_scroll_screen.dart';

import '../screens/poster_screen.dart';

void main() {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  AppGetIt.init().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScrollScreen(),
      routes: {
        // MoviesScreen.routeName: (ctx) => const MoviesScreen(),
        PosterScreen.routeName: (ctx) => const PosterScreen(),
      },
      // ),
    );
  }
}
