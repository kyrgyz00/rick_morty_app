import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/character/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/internal/helpers/api_requester.dart';

import '../../../../internal/helpers/error_helper.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  APIRequester requester = APIRequester();
  late List<CharacterModel> characterModelList;
  @override
  Future<List<CharacterModel>> getCharacter() async {
    try {
      log("message");
      Response response = await requester.toGet(
        "/character",
      );
      log("message");
      log(response.data.runtimeType.toString());
      if (response.statusCode == 200) {
        characterModelList = response.data["results"]
            .map<CharacterModel>((el) => CharacterModel.fromJson(el))
            .toList();
        return characterModelList;
      } else {
        throw ErrorsEnum.invalidError;
      }
    } catch (e) {
      log(e.toString());
      throw ErrorsEnum.invalidError;
    }
  }
}
