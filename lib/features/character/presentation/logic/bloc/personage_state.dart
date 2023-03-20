part of 'personage_bloc.dart';


abstract class CharacterState {}

class PersonageInitial extends CharacterState {}

class CharacterFetchedState extends CharacterState {
  final List<CharacterModel> listOfCharacterModel;

  CharacterFetchedState(this.listOfCharacterModel);
}

class LoadingState extends CharacterState {}

class ErrorsState extends CharacterState {
  final ErrorsEnum error;

  ErrorsState(this.error);
}

class CharacterEpisodeFetchedState extends CharacterState {
  final List<EpisodeModel> characterEpisodeList;

  CharacterEpisodeFetchedState(this.characterEpisodeList);
}