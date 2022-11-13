import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/params/person_params.dart';
import '../../../domain/entities/person_movie_credits_entity.dart';
import '../../../domain/use_case/get_person_movie_credits.dart';

part 'person_movie_credits_event.dart';
part 'person_movie_credits_state.dart';

class PersonMovieCreditsBloc
    extends Bloc<PersonMovieCreditsEvent, PersonMovieCreditsState> {
  final GetPersonMovieCreditsUseCase _getPersonMovieCreditsUseCase;
  PersonMovieCreditsBloc({
    required GetPersonMovieCreditsUseCase getPersonMovieCreditsUseCase,
  })  : _getPersonMovieCreditsUseCase = getPersonMovieCreditsUseCase,
        super(PersonMovieCreditsInitial()) {
    on<GetPersonMovieCreditsByIdEvent>(_getPersonMovieCreditsByIdEventHandler);
  }

  Future<void> _getPersonMovieCreditsByIdEventHandler(
    GetPersonMovieCreditsByIdEvent event,
    Emitter<PersonMovieCreditsState> emit,
  ) async {
    final state = this.state;
    final int id = event.id;

    if (state is PersonMovieCreditsInitial) {
      emit(const PersonMovieCreditsLoadingState());

      final either = await _getPersonMovieCreditsUseCase(PersonParams(id: id));
      await either.fold(
        (failure) async {
          emit(const PersonMovieCreditsErrorState());
        },
        (personMovieCredits) async {
          emit(PersonMovieCreditsLoadedState(
            personMovieCredits: personMovieCredits,
          ));
        },
      );
    }
  }
}
