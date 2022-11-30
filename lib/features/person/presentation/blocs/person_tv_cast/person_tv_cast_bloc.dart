import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_person_tv_cast.dart';
import '../../../domain/entities/params/person_params.dart';
import '../../../../tv/domen/entities/tv_cast_entity.dart';

part 'person_tv_cast_event.dart';
part 'person_tv_cast_state.dart';

class PersonTvCastBloc extends Bloc<PersonTvCastEvent, PersonTvCastState> {
  final GetPersonTvCastsUseCase _getPersonTvCastsUseCase;
  PersonTvCastBloc({
    required GetPersonTvCastsUseCase getPersonTvCastsUseCase,
  })  : _getPersonTvCastsUseCase = getPersonTvCastsUseCase,
        super(
          PersonTvCastInitial(),
        ) {
    on<GetPersonTvCastByIdEvent>(_getPersonTvCastByIdEventHandler);
  }

  Future<void> _getPersonTvCastByIdEventHandler(
    GetPersonTvCastByIdEvent event,
    Emitter<PersonTvCastState> emit,
  ) async {
    final state = this.state;
    final int id = event.id;

    if (state is PersonTvCastInitial) {
      emit(const PersonTvCastLoadingState());

      final either = await _getPersonTvCastsUseCase(PersonParams(id: id));

      await either.fold(
        (failure) async {
          emit(const PersonTvCastErrorState());
        },
        (tvCast) async {
          tvCast.sort(
            (a, b) => b.popularity!.compareTo(a.popularity!),
          );
          emit(PersonTvCastLoadedState(
            tvCast: tvCast,
          ));
        },
      );
    }
  }
}
