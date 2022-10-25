import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../blocs/scroll_list/scroll_list_bloc.dart';

class ScrollListWidget<T extends Bloc<ScrollListBloc, ScrollListState>>
    extends StatelessWidget {
  const ScrollListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider<>
    return BlocBuilder<T, ScrollListState>(builder: (context, state) {
      if (state is ScrollListLoadingState) {
        return const Center(
          child: Text('Loading state'),
        );
      } else if (state is ScrollListLoadedState) {
        return Column(
          children: <Widget>[
            AppBar(
              elevation: 0,
              title: const Text(
                'wwwwww....',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {},
                  // async => BlocProvider.of<T>(context)
                  //     .add(const ScrollListLoadEvent()),
                  icon: const Icon(Icons.arrow_forward),
                  color: Colors.black,
                ),
              ],
            ),
            // ScrollItemWidget(item: item)
          ],
        );
      } else if (state is ScrollListErrorState) {
        return const Center(
          child: Text('Error state'),
        );
      } else if (state is ScrollListInitial) {
        return const Center(
          child: Text('Initial State'),
        );
      }
      return const Center(child: Text('aaaaaaaaaaaa'));
    });
  }
}

class TypeScrollList extends Equatable {
  final String title;
  final String path;
  final Map<String, String>? query;

  const TypeScrollList({
    required this.title,
    required this.path,
    required this.query,
  });

  @override
  List<Object?> get props => [title, path, query];
}
