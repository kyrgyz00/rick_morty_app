import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';

import '../../../../../internal/helpers/error_helper.dart';
import '../../../domain/use_case/location_use_case.dart';
import '../../../data/models/location_model.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<GetLocationEvent>((event, emit) async {
      log("message1111");
      emit(LocationLoadingState());
      try {
        List<LocationModel> locationModelList =
            await LocationUseCase().getLocation();
        log(locationModelList.toString());
        emit(LocationFetchedState(locationModelList,));
      } catch (e) {
        log(e.toString());
        emit(ErrorsState(ErrorsEnum.invalidError));
      }
    });
  }
}
