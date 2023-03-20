part of 'episodes_bloc.dart';

@immutable
abstract class EpisodesEvent {}

class GetEpisodeEvent extends EpisodesEvent {}

class GetEpisodeCharacterEvent extends EpisodesEvent {
  final EpisodeModel episodeModel;

  GetEpisodeCharacterEvent(this.episodeModel);
}
