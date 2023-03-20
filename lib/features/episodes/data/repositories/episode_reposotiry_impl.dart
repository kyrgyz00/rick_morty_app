import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/character/presentation/logic/bloc/personage_bloc.dart';
import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty_app/features/episodes/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty_app/internal/helpers/api_requester.dart';

import '../../../../internal/helpers/error_helper.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  APIRequester requester = APIRequester();
  late List<EpisodeModel> episodeModel;

  @override
  Future<List<EpisodeModel>> getEpisodes() async {
    try {
      Response response = await requester.toGet("/episode");

      if (response.statusCode == 200) {
        episodeModel = response.data["results"]
            .map<EpisodeModel>((el) => EpisodeModel.fromJson(el))
            .toList();
        return episodeModel;
      } else {
        throw ErrorsEnum.invalidError;
      }
    } catch (e) {
      log(e.toString());
      throw ErrorsEnum.invalidError;
    }
  }

  @override
  Future<List<CharacterModel>> getEpisodeCharacters(
      EpisodeModel episodeModel) async {
    List<CharacterModel> characters = [];

    try {
      for (var element in episodeModel.characters ?? []) {
        Response characterResponse = await requester
            .toGet('/character/${element.replaceAll(RegExp('[^0-9]'), "")}');

        characters.add(CharacterModel.fromJson(characterResponse.data));
      }
      return characters;
    } catch (e) {
      log(e.toString());
      if (e is ErrorsEnum) {
        throw ErrorsState(e);
      } else {
        throw ErrorsEnum.invalidError;
      }
    }
  }
}
