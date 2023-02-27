import 'package:rick_and_morty_app/features/rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/rick_and_morty/domain/use_case/character_use_case.dart';

class UserRepository {
  Future<List<CharacterModel>> getCharacter() {
    CharacterUseCase characterUseCase = CharacterUseCase();
    return characterUseCase.getCharacter();
  }
}
