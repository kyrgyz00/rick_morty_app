part of 'location_bloc.dart';

abstract class LocationEvent {}

class GetLocationEvent extends LocationEvent {}

class GetLocationCharecters extends LocationEvent {
  final LocationModel locationModel;

  GetLocationCharecters(this.locationModel);
}
