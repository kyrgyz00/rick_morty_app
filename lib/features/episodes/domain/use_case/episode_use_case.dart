import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty_app/features/episodes/data/repositories/episode_reposotiry_impl.dart';

class EpisodesUseCase {
  EpisodeRepositoryImpl episodeRepositoryImpl = EpisodeRepositoryImpl();
  Future<List<EpisodeModel>> getEpisodes() async =>
      await episodeRepositoryImpl.getEpisodes();
}
