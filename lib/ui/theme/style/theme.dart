import 'package:flutter/material.dart';
import 'package:hesat_quran/ui/theme/style/colors.dart';

ThemeData getTheme() {
  return ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'font',
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.gray! ,width: 2),
          borderRadius: BorderRadius.circular(10)
      ),
      isDense: true,
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.gray!,
            width: 2
          ),
          borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.gray!,
            width: 2
          ),
          borderRadius: BorderRadius.circular(10)),
    ),
  );
}
