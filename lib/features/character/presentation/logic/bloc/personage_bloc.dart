import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_app/features/character/domain/use_case/character_use_case.dart';
import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty_app/internal/helpers/error_helper.dart';

import '../../../data/models/character_model.dart';
part 'personage_event.dart';
part 'personage_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(PersonageInitial()) {
    on<GetCharacterEvent>((event, emit) async {
      emit(LoadingState());
      try {
        List<CharacterModel> characterModelList =
            await CharacterUseCase().getCharacter();
        log(characterModelList.toString());
        emit(CharacterFetchedState(characterModelList));
      } catch (e) {
        log(e.toString());
        emit(ErrorsState(ErrorsEnum.invalidError));
      }
    });
    on<GetCharacterEpisodeEvent>((event, emit) async {
      emit(LoadingState());
      try {
        List<EpisodeModel> episodeModel =
            await CharacterUseCase().getCharacterEpisodes(event.characterModel);
        log(episodeModel.toString());
        emit(CharacterEpisodeFetchedState(episodeModel));
      } catch (e) {
        log(e.toString());
        emit(ErrorsState(ErrorsEnum.invalidError));
      }
    });
  }
}
