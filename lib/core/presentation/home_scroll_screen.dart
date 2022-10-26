import 'package:flutter/material.dart';

import 'widgets/horiz_scroll_list_widget/horiz_scroll_list_widget.dart';

class HomeScrollScreen extends StatelessWidget {
  const HomeScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lost movies'),
      ),
      body: Column(
        children: <Widget>[
          HorizScrollListWidget(instanceName: 'Trending'),
          // HorizScrollListWidget(instanceName: 'Trending'),
          HorizScrollListWidget(instanceName: 'Popular'),
        ],
      ),
    );
  }
}
