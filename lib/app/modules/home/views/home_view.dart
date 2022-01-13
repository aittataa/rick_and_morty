import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/app/modules/home/models/character.dart';
import 'package:rick_and_morty/app/shared/bounce_point.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomeView')),
      body: Obx(() {
        final bool state = controller.state.value;
        if (state) {
          return BouncePoint(size: 30);
        } else {
          final AllCharacters characters = controller.characters.value;
          return Center(child: Text(characters.results!.length.toString()));
          //return Center(child: Text(characters.info!.count.toString()));
        }
      }),
    );
  }
}
