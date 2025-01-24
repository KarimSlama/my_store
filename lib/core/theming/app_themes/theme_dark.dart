import 'package:flutter/material.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';

ThemeData themeDark = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: AppColors.lightBlue,
    secondary: AppColors.lightBlue,
    error: Colors.red,
    onPrimary: AppColors.blue,
    onSecondary: AppColors.blue,
    surface: AppColors.lightBlue,
    onError: AppColors.blue,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.lightBlue,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 18,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.white,
      size: 26,
    ),
    toolbarTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 14,
      fontFamily: 'Cairo',
    ),
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.white,
  ),
);
