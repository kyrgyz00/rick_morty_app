part of 'location_bloc.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationFetchedState extends LocationState {
  final List<LocationModel> listOfLOcationModel;
  // final List<CharacterModel> characterModel;
  LocationFetchedState(
    this.listOfLOcationModel,
  );
}

class LocationCharectersFetchedState extends LocationState {
  final List<CharacterModel> listOfCharectesModels;
  // final List<CharacterModel> characterModel;
  LocationCharectersFetchedState(
    this.listOfCharectesModels,
  );
}

class LocationLoadingState extends LocationState {}

class ErrorsState extends LocationState {
  final ErrorsEnum error;

  ErrorsState(this.error);
}
