import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';

import '../../data/models/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getCharacter();
    Future<List<EpisodeModel>> getCharacterEpisode(CharacterModel characterModel);
}
