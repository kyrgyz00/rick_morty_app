import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/features/location/presentaion/logic/bloc/location_bloc.dart';

import '../../../character/data/models/character_model.dart';

abstract class LocationRepository {
  Future<List<LocationModel>> getLocation();

  Future<List<CharacterModel>> getLocationCharecters(
      LocationModel locationModel);
}
