import 'package:flutter/material.dart';
import 'package:nasa_app/app/common/resources/app_colors.dart';
import 'package:nasa_app/app/common/resources/app_fonts.dart';

class MyAppBar extends AppBar with PreferredSizeWidget {
  final String? label;
  final double? height;
  final Color? appBarColor;
  final bool? autoImplyLeading;

  @override
  get preferredSize => Size.fromHeight(height ?? 80);

  MyAppBar(
      {Key? key,
      this.label,
      this.height,
      this.appBarColor,
      this.autoImplyLeading})
      : super(
          key: key,
          backgroundColor: appBarColor ?? AppColors.white,
          elevation: 0.3,
          iconTheme: const IconThemeData(
            color: AppColors.primary,
          ),
          centerTitle: true,
          title: Text(label ?? 'Nasa App').titleBold(),
          toolbarHeight: height ?? 80,
          automaticallyImplyLeading: autoImplyLeading ?? true,
        );
}
