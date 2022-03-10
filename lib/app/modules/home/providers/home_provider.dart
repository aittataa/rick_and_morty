import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/app/config/app_enum.dart';
import 'package:rick_and_morty/app/config/app_response.dart';
import 'package:rick_and_morty/app/config/app_url.dart';
import 'package:rick_and_morty/app/modules/home/filters/character_filter.dart';
import 'package:rick_and_morty/app/modules/home/filters/episode_filter.dart';
import 'package:rick_and_morty/app/modules/home/models/character.dart';
import 'package:rick_and_morty/app/modules/home/models/episode.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() => {httpClient.baseUrl = AppUrl.baseUrl};
  Uri _getUrl(String type) => Uri.parse("${httpClient.baseUrl}$type");

  /// TODO : About Characters
  getEpisodes(EpisodeFilter filter) async {
    final Uri uri = _getUrl(AppUrl.episodes);
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: episodesFromJson(appResponse.response),
      );
    } else {
      return appResponse;
    }
  }

  getEpisode(List<int> ids) async {
    final Uri uri = _getUrl("${AppUrl.episodes}$ids");
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: characterListFromJson(appResponse.response.body),
      );
    } else {
      return appResponse;
    }
  }

  /*filterCharacters(CharacterFilter filter) async {
    final String search = '''?name=${filter.name}&status=${characterStatusValues[filter.status]}&gender=${characterGenderValues[filter.gender]}&type=${filter.type}&species=${characterSpeciesValues[filter.species]}''';
    final Uri uri = _getUrl("${AppUrl.characters}$search");
    print(uri);
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: characterListFromJson(appResponse.response.body),
      );
    } else {
      return appResponse;
    }
  }*/

  /// TODO : About Characters
  getCharacters(CharacterFilter filter) async {
    final Uri uri = _getUrl(AppUrl.characters);
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: charactersFromJson(appResponse.response),
      );
    } else {
      return appResponse;
    }
  }

  getCharacter(List<int> ids) async {
    final Uri uri = _getUrl("${AppUrl.characters}$ids");
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: characterListFromJson(appResponse.response.body),
      );
    } else {
      return appResponse;
    }
  }

  filterCharacters(CharacterFilter filter) async {
    final String search = '''?name=${filter.name}&status=${characterStatusValues[filter.status]}&gender=${characterGenderValues[filter.gender]}&type=${filter.type}&species=${characterSpeciesValues[filter.species]}''';
    final Uri uri = _getUrl("${AppUrl.characters}$search");
    print(uri);
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: characterListFromJson(appResponse.response.body),
      );
    } else {
      return appResponse;
    }
  }
}
