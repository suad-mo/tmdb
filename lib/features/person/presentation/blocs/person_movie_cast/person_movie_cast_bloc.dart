import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/params/person_params.dart';
import '../../../domain/use_case/get_person_movie_cast.dart';
import '../../../../movie/domen/entities/movie_cast_entity.dart';

part 'person_movie_cast_event.dart';
part 'person_movie_cast_state.dart';

class PersonMovieCastBloc
    extends Bloc<PersonMovieCastEvent, PersonMovieCastState> {
  final GetPersonMovieCastsUseCase _getPersonMovieCastsUseCase;
  PersonMovieCastBloc({
    required GetPersonMovieCastsUseCase getPersonMovieCastsUseCase,
  })  : _getPersonMovieCastsUseCase = getPersonMovieCastsUseCase,
        super(PersonMovieCastInitial()) {
    on<GetPersonMovieCastByIdEvent>(_getPersonMovieCastByIdEventHandler);
  }

  Future<void> _getPersonMovieCastByIdEventHandler(
    GetPersonMovieCastByIdEvent event,
    Emitter<PersonMovieCastState> emit,
  ) async {
    final state = this.state;
    final int id = event.id;

    if (state is PersonMovieCastInitial) {
      emit(const PersonMovieCastLoadingState());

      final either = await _getPersonMovieCastsUseCase(PersonParams(id: id));

      await either.fold(
        (failure) async {
          emit(const PersonMovieCastErrorState());
        },
        (movieCast) async {
          movieCast.sort(
            (a, b) => b.popularity!.compareTo(a.popularity!),
          );
          emit(PersonMovieCastLoadedState(
            movieCast: movieCast,
          ));
        },
      );
    }
  }
}
