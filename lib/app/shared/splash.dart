import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../config/app_constant.dart';
import '../config/app_message.dart';
import '../config/app_theme.dart';
import '../modules/home/views/home_view.dart';
import '../shared/bounce_point.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(flex: 3, child: Image.asset(AppMessage.appLogo, width: 200, height: 200)),
          Expanded(child: BouncePoint()),
        ],
      ),
      nextScreen: HomeView(),
      curve: AppConstant.curve,
      backgroundColor: AppTheme.primaryBackColor,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      animationDuration: AppConstant.durationSplash,
      splashIconSize: double.infinity,
    );
  }
}
