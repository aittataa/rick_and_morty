import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/app/config/app_constant.dart';
import 'package:rick_and_morty/app/config/app_message.dart';
import 'package:rick_and_morty/app/config/app_response.dart';
import 'package:rick_and_morty/app/config/app_theme.dart';
import 'package:rick_and_morty/app/modules/home/controllers/home_controller.dart';
import 'package:rick_and_morty/app/modules/home/models/character.dart';
import 'package:rick_and_morty/app/modules/home/models/episode.dart';
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
        final bool state = controller.episodesState.value;
        if (state) {
          return BouncePoint(size: 30);
        } else {
          final AppResponse appResponse = controller.episodesResponse.value;
          if (appResponse.success) {
            final AllEpisodes episodes = controller.episodes.value;
            return ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10),
              itemCount: episodes.results!.length,
              itemBuilder: (context, i) {
                final Episode episode = episodes.results![i];
                return EpisodeShape(episode: episode);
              },
            );
          }
          return ResponseError(response: appResponse);
        }
      }),
    );
  }
}

class EpisodeShape extends StatelessWidget {
  final Episode episode;
  const EpisodeShape({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.primaryBackColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        horizontalTitleGap: 0,
        title: Text(
          "${episode.name}",
          style: TextStyle(
            color: AppTheme.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                "${episode.episode}",
                style: TextStyle(
                  color: AppTheme.mainColor,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "${episode.airDate}",
                style: TextStyle(
                  color: AppTheme.mainColor,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
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
