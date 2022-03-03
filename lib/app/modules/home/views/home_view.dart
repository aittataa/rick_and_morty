import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/app/config/app_constant.dart';
import 'package:rick_and_morty/app/config/app_function.dart';
import 'package:rick_and_morty/app/config/app_message.dart';
import 'package:rick_and_morty/app/config/app_response.dart';
import 'package:rick_and_morty/app/config/app_theme.dart';
import 'package:rick_and_morty/app/modules/home/controllers/home_controller.dart';
import 'package:rick_and_morty/app/modules/home/models/character.dart';
import 'package:rick_and_morty/app/shared/bounce_point.dart';
import 'package:rick_and_morty/app/shared/response_error.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppMessage.appTitle)),
      body: Obx(() {
        final bool state = controller.state.value;
        if (state) {
          return BouncePoint(size: 30);
        } else {
          AppResponse appResponse = controller.appResponse.value;
          if (appResponse.success) {
            final AllCharacters characters = controller.characters.value;
            return GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10),
              gridDelegate: AppFunction.gridDelegate(crossAxisCount: 2, childAspectRatio: .75),
              itemCount: characters.results!.length,
              itemBuilder: (context, i) {
                final Character character = characters.results![i];
                return CharacterShape(character: character);
              },
            );
          }
          return ResponseError(response: appResponse);
        }
      }),
    );
  }
}

class CharacterShape extends StatelessWidget {
  final Character character;
  const CharacterShape({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primaryBackColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage("${character.image}"),
                ),
              ),
            ),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(
              "${character.name}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "${character.species}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.mainColor,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
