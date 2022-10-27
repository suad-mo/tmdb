import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/movies_response/movies_response_bloc.dart';
import '../../dependensi_injection/get_it.dart';

class MoviesReviewScreen extends StatelessWidget {
  const MoviesReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesResponseBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('title'),
        ),
      ),
    );
  }
}
