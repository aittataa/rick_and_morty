import 'package:get/get.dart';
import 'package:rick_and_morty/app/config/app_response.dart';
import 'package:rick_and_morty/app/modules/home/models/episode.dart';
import 'package:rick_and_morty/app/modules/home/providers/home_provider.dart';

import '../filters/episode_filter.dart';

class HomeController extends GetxController {
  final HomeProvider _provider = Get.put(HomeProvider());

  /// TODO : Episodes
  var episodesResponse = AppResponse().obs;
  var episodes = AllEpisodes().obs;
  var episodesState = false.obs;

  /// TODO : Characters
  // var appResponse = AppResponse().obs;
  // var state = false.obs;
  // var characters = AllCharacters().obs;

  @override
  void onInit() {
    super.onInit();
    _getEpisodes;
    //_getCharacters;
  }

  get _getEpisodes async {
    episodesState.value = true;
    AppResponse response = await _provider.getEpisodes(EpisodeFilter());
    if (response.success) {
      episodes.value = response.response;
    }
    episodesResponse.value = response;
    episodesState.value = false;
  }

  /*get _getCharacters async {
    state.value = true;
    AppResponse response = await _provider.getCharacters(CharacterFilter());
    if (response.success) {
      characters.value = response.response;
    }
    appResponse.value = response;
    state.value = false;
  }*/
}
