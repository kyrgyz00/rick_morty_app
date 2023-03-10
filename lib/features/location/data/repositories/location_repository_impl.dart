import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/location/data/models/location_model.dart';
import 'package:rick_and_morty_app/features/location/domain/repositories/location_repository.dart';
import 'package:rick_and_morty_app/internal/helpers/api_requester.dart';

import '../../../../internal/helpers/error_helper.dart';

class LocationRepositoryImpl implements LocationRepository {
  APIRequester requester = APIRequester();
  late List<LocationModel> locationModelList;
  @override
  Future<List<LocationModel>> getLocation() async {
    try {
      log("location message");
      Response response = await requester.toGet(
        "/location",
      );
      log("location succes");
      if (response.statusCode == 200) {
        locationModelList = response.data["results"]
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

  @override
  Future<List<CharacterModel>> getLocationCharecters(
      LocationModel locationModel) async {
    List<CharacterModel> charesters = [];
    for (var element in locationModel.residents ?? []) {
      Response charecterResponse = await requester
          .toGet('/character/${element.replaceAll(RegExp('[^0-9]'), "")}');

      charesters.add(CharacterModel.fromJson(charecterResponse.data));
    }
    return charesters;
  }
}
