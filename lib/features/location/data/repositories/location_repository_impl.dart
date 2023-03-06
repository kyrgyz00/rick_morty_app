import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/features/location/domain/repositories/location_repository.dart';
import 'package:rick_and_morty_app/internal/helpers/api_requester.dart';

import '../../../../internal/helpers/error_helper.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<List<LocationModel>> getLocation() async {
    try {
      APIRequester requester = APIRequester();
      log("location message");
      Response response = await requester.toGet(
        "/location",
      );
      log("location succes");
      log(response.data.runtimeType.toString());
      if (response.statusCode == 200) {
        List<LocationModel> locationModelList = response.data["results"]
            .map<LocationModel>((el) => LocationModel.fromJson(el))
            .toList();
        return locationModelList;
      } else {
        throw ErrorsEnum.invalidError;
      }
    } catch (e) {
      log(e.toString());
      throw ErrorsEnum.invalidError;
    }
  }
}
