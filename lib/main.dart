import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/app/config/app_message.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppMessage.appTitle,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
