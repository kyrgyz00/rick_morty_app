import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';

abstract class EpisodeRepository {
  Future<List<EpisodeModel>> getEpisodes();
  Future<List<CharacterModel>> getEpisodeCharacters(EpisodeModel episodeModel);
}
