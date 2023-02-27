
import 'package:rick_and_morty_app/features/character/data/repositories/character_repository_impl.dart';

import '../../data/models/character_model.dart';


class CharacterUseCase {
  CharacterRepositoryImpl characterRepositoryImpl = CharacterRepositoryImpl();
  Future<List<CharacterModel>> getCharacter() async =>
      await characterRepositoryImpl.getCharacter();
}