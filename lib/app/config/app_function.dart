import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_constant.dart';
import 'app_theme.dart';

class AppFunction {
  AppFunction._();

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

  static snackBar({required String title, required String message}) {
    return Get.snackbar(
      "",
      "",
      backgroundColor: AppTheme.expenseColor,
      margin: EdgeInsets.only(top: 25, right: 15, left: 15),
      duration: AppConstant.durationSnack,
      titleText: Text(
        title,
        style: TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.w900,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.bold,
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
        systemNavigationBarColor: AppTheme.primaryBackColor,
        systemNavigationBarDividerColor: AppTheme.primaryBackColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppTheme.transparentColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
  }
}
