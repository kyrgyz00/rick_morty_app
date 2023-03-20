part of 'episodes_bloc.dart';

@immutable
abstract class EpisodesState {}

class EpisodesInitial extends EpisodesState {}

class EpisodesFetchedState extends EpisodesState {
  final List<EpisodeModel> episodeModel;

  EpisodesFetchedState(this.episodeModel);
}

class EpisodeLoadingState extends EpisodesState {}

class EpisodeErrorState extends EpisodesState {
  final ErrorsEnum error;

  EpisodeErrorState(this.error);
}
class EpisodesCharacterFetchedState extends EpisodesState {
  final List<CharacterModel> episodeCharacterModelList;

  EpisodesCharacterFetchedState(this.episodeCharacterModelList);
}
