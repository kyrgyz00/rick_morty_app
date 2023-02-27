import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty_app/internal/helpers/api_requester.dart';
import 'package:rick_and_morty_app/internal/helpers/error_helper.dart';

class CharacterUseCase {
  Future<List<CharacterModel>> getCharacter() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet(
        "/character/",
      );
      if (response.statusCode == 200) {
        log(response.data);
        List<CharacterModel> characterModelList = response.data
            .map<CharacterModel>((el) => CharacterModel.fromJson(el))
            .toList();
        return characterModelList;
      } else {
        throw ErrorsEnum;
      }
    } catch (e) {
      print("231 $e");
      throw ErrorsEnum;
    }
  }
}
