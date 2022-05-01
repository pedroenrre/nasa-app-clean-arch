import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    scaffoldBackgroundColor: AppColors.background,
    iconTheme: const IconThemeData(color: AppColors.white),
  );
}
