import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/features/location/data/repositories/location_repository_impl.dart';
import 'package:rick_and_morty_app/features/location/presentaion/logic/bloc/location_bloc.dart';

import '../../../character/data/models/character_model.dart';

class LocationUseCase {
  LocationRepositoryImpl locationRepositoryImpl = LocationRepositoryImpl();

  Future<List<LocationModel>> getLocation() async =>
      await locationRepositoryImpl.getLocation();
  Future<List<CharacterModel>> getLocationCharecters(
          LocationModel locationModel) async =>
      await locationRepositoryImpl.getLocationCharecters(locationModel);
}
