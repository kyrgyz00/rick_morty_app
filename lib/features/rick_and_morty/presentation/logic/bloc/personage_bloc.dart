import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_app/features/rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/internal/helpers/error_helper.dart';
part 'personage_event.dart';
part 'personage_state.dart';

class PersonageBloc extends Bloc<PersonageEvent, PersonageState> {
  PersonageBloc() : super(PersonageInitial()) {
    on<GetCharacterEvent>((event, emit) async {
      log("11111=========11111");
      emit(LoadingState());
      try {
        List<CharacterModel> characterModelList =
            await UserRepository().getCharacter();
        log(characterModelList.toString());
        emit(CharacterFetchedState(characterModelList));
      } catch (e) {
        log(e.toString());
        emit(ErrorsState(ErrorsEnum.invalidError));
      }
    });
  }
}
