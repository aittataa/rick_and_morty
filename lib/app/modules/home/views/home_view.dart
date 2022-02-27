import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/app/config/app_constant.dart';
import 'package:rick_and_morty/app/config/app_function.dart';
import 'package:rick_and_morty/app/config/app_message.dart';
import 'package:rick_and_morty/app/config/app_response.dart';
import 'package:rick_and_morty/app/config/app_theme.dart';
import 'package:rick_and_morty/app/shared/bounce_point.dart';
import 'package:rick_and_morty/app/shared/response_error.dart';

import '../controllers/home_controller.dart';
import '../models/character.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());
  // final PagingController _pagingController = PagingController(firstPageKey: 1);
  @override
  void initState() {
    super.initState();
    // _pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
  }

  // Future<void> _fetchPage(int pageKey) async {
  //   try {
  // final newPage = await widget.repository.getArticleListPage(
  //   number: pageKey,
  //   size: 8,
  //   1
  //   filteredPlatformIds: _listPreferences?.filteredPlatformIds,
  //   filteredDifficulties: _listPreferences?.filteredDifficulties,
  //   filteredCategoryIds: _listPreferences?.filteredCategoryIds,
  //   sortMethod: _listPreferences?.sortMethod,
  // );
  //
  // final previouslyFetchedItemsCount = _pagingController.itemList?.length ?? 0;
  // final isLastPage = newPage.isLastPage(previouslyFetchedItemsCount);
  // final newItems = newPage.itemList;
  //
  // if (isLastPage) {
  //   _pagingController.appendLastPage(newItems);
  // } else {
  //   final nextPageKey = pageKey + 1;
  //   _pagingController.appendPage(newItems, nextPageKey);
  // }
  // } catch (error) {
  // 4
  // _pagingController.error = error;
  // }
  // }

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
              physics: ScrollPhysics(),
              padding: EdgeInsets.all(10),
              gridDelegate: AppFunction.gridDelegate(crossAxisCount: 2, childAspectRatio: .75),
              itemCount: characters.results!.length,
              itemBuilder: (context, i) {
                final Character character = characters.results![i];
                return CharacterShape(character: character);
              },
            );
            /*return PagedGridView(
              pagingController: PagingController(firstPageKey: 0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, i) {
                  return SizedBox();
                },
              ),
            );*/
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
          Expanded(child: Container()),
          ListTile(
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            minLeadingWidth: 0,
            horizontalTitleGap: 0,
            title: Text(
              "${character.name}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
