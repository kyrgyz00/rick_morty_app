
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/features/location/data/repositories/location_repository_impl.dart';

class LocationUseCase {
  LocationRepositoryImpl locationRepositoryImpl = LocationRepositoryImpl();
  Future<List<LocationModel>> getLocation() async =>
      await locationRepositoryImpl.getLocation();
}
