import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_constant.dart';
import 'app_theme.dart';

class AppFunction {
  AppFunction._();

  static gridDelegate({int crossAxisCount = 1, double spacing = 10, double childAspectRatio = 1}) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: childAspectRatio,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
    );
  }

  static messageBox({required String message}) {
    return Get.snackbar(
      "",
      "",
      backgroundColor: AppTheme.mainColor,
      margin: const EdgeInsets.only(bottom: 64),
      padding: const EdgeInsets.all(10),
      maxWidth: 200,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 100,
      duration: AppConstant.durationSnack,
      messageText: const SizedBox(),
      titleText: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  static animateToPage(int index) {
    AppConstant.pageIndex = index;
    AppConstant.pageController.animateToPage(
      AppConstant.pageIndex,
      duration: AppConstant.durationPage,
      curve: AppConstant.curve,
    );
  }

  static get configureDependencies {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppTheme.mainColor,
        systemNavigationBarDividerColor: AppTheme.mainColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: AppTheme.transparentColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
  }
}
