import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/config/app_function.dart';
import 'app/config/app_message.dart';
import 'app/config/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies();
  runApp(RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      getPages: AppPages.routes,
    );
  }
}
