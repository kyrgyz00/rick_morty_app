import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty_app/features/episodes/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty_app/internal/helpers/api_requester.dart';

import '../../../../internal/helpers/error_helper.dart';

class EpisodeRepositoryImpl implements EpisodeRepository{
  APIRequester requester=APIRequester();
  late List<EpisodeModel>episodeModel;
  @override
  Future<List<EpisodeModel>> getEpisodes() async{
   try{
Response response= await requester.toGet("/episode");

if (response.statusCode == 200) {
        episodeModel = response.data["results"]
            .map<EpisodeModel>((el) => EpisodeModel.fromJson(el))
            .toList();
        return episodeModel;
      } else {
        throw ErrorsEnum.invalidError;
      }
   }catch(e){
      log(e.toString());
      throw ErrorsEnum.invalidError;
   }
   
  }

}