import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color mainColor = Color(0xFF24282F);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color primaryBackColor = Color(0xFFFFFFFF);
  static const Color secondaryBackColor = Color(0xFF3C3E44);
  static const Color transparentColor = Color(0x00000000);
  static const Color shadowColor = Color(0x1F000000);

  /// TODO : Icons
  static const Color primaryIconColor = Color(0xFF000000);
  static const Color secondaryIconColor = Color(0xFFFFFFFF);

  /// TODO : Texts
  static const Color primaryTextColor = Color(0xFF000000);
  static const Color secondaryTextColor = Color(0xFFFFFFFF);

  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: AppTheme.backgroundColor,
      primaryColor: AppTheme.backgroundColor,
      splashColor: AppTheme.backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.mainColor,
        titleTextStyle: TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
    );
  }
}
