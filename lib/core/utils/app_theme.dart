import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(
        0xff1D1E1D,
      ),
      foregroundColor: AppColors.whiteColor,
    ),
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: "Poppins",
  );
}
