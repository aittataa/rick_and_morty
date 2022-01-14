import 'package:get/get.dart';
import 'package:rick_and_morty/app/config/app_response.dart';
import 'package:rick_and_morty/app/modules/home/filters/character_filter.dart';
import 'package:rick_and_morty/app/modules/home/models/character.dart';
import 'package:rick_and_morty/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider _provider = Get.put(HomeProvider());
  var appResponse = AppResponse().obs;
  var state = false.obs;
  var characters = AllCharacters().obs;
  var characterList = <Character>[].obs;
  var character = Character().obs;

  @override
  void onInit() {
    super.onInit();
    _getCharacters;
  }

  get _getCharacters async {
    state.value = true;
    AppResponse response = await _provider.getCharacters(CharacterFilter());
    if (response.success) {
      characters.value = response.response;
    }
    appResponse.value = response;
    state.value = false;
  }
}
