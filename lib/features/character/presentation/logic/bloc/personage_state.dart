part of 'personage_bloc.dart';


abstract class PersonageState {}

class PersonageInitial extends PersonageState {}

class CharacterFetchedState extends PersonageState {
  final List<CharacterModel> listOfCharacterModel;

  CharacterFetchedState(this.listOfCharacterModel);
}

class LoadingState extends PersonageState {}

class ErrorsState extends PersonageState {
  final ErrorsEnum error;

  ErrorsState(this.error);
}
