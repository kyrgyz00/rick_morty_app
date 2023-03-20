import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty_app/features/episodes/domain/use_case/episode_use_case.dart';
import 'package:rick_and_morty_app/internal/helpers/error_helper.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc() : super(EpisodesInitial()) {

    on<GetEpisodeEvent>((event, emit) async {
      emit(EpisodeLoadingState());
      try {
        List<EpisodeModel> episodeModel = await EpisodesUseCase().getEpisodes();
        log(episodeModel.toString());
        emit(EpisodesFetchedState(episodeModel));
      } catch (e) {
        log(e.toString());
        emit(EpisodeErrorState(ErrorsEnum.invalidError));
      }
    });

    on<GetEpisodeCharacterEvent>((event, emit) async {
      emit(EpisodeLoadingState());
      try {
        List<CharacterModel> characterModel = await EpisodesUseCase().getEpisodeCharacter(event.episodeModel);
        log(characterModel.toString());
        emit(EpisodesCharacterFetchedState(characterModel));
      } catch (e) {
        log(e.toString());
        emit(EpisodeErrorState(ErrorsEnum.invalidError));
      }
    });
  }
}
