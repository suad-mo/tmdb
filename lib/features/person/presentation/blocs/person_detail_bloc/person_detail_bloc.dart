// import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/features/person/domain/entities/params/person_params.dart';
import 'package:tmdb/features/person/domain/use_case/get_person_detail.dart';

import '../../../domain/entities/person_detail_entyty.dart';

part 'person_detail_event.dart';
part 'person_detail_state.dart';

class PersonDetailBloc extends Bloc<PersonDetailEvent, PersonDetailState> {
  final GetPersonDetailUseCase _getPersonDetailUseCase;
  PersonDetailBloc({
    required GetPersonDetailUseCase getPersonDetailUseCase,
  })  : _getPersonDetailUseCase = getPersonDetailUseCase,
        super(PersonDetailInitial()) {
    on<GetPersonDetailByIdEvent>(_getPersonDetailByIdEventHandler);
  }

  Future<void> _getPersonDetailByIdEventHandler(
    GetPersonDetailByIdEvent event,
    Emitter<PersonDetailState> emit,
  ) async {
    final state = this.state;
    final int id = event.id;

    if (state is PersonDetailInitial) {
      emit(const PersonDetailLoadingState());

      final either = await _getPersonDetailUseCase(PersonParams(id: id));
      await either.fold(
        (failure) async {
          emit(const PersonDetailErrorState());
        },
        (personDetail) async {
          emit(PersonDetailLoadedState(personDetail: personDetail));
        },
      );
    }
  }
}
