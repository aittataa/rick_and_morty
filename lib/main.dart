import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/app/config/app_theme.dart';
import 'package:rick_and_morty/app/shared/splash.dart';

import 'app/config/app_function.dart';
import 'app/config/app_message.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies;
  runApp(RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      // getPages: AppPages.routes,
      // initialRoute: AppPages.INITIAL,
      // home: HomeView(),
      home: Splash(),
    );
  }
}
