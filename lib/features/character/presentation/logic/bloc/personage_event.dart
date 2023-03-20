part of 'personage_bloc.dart';

abstract class CharacterEvent {}

class GetCharacterEvent extends CharacterEvent {
  // final CharacterModel characterModel;

  // GetCharacterEvent(this.characterModel);
}

class GetCharacterEpisodeEvent extends CharacterEvent {
  final CharacterModel characterModel;

  GetCharacterEpisodeEvent(this.characterModel);
}
