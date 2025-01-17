import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_sale_boss/core/utils/app_colors.dart';

const _inter = 'Inter';

class AppTheme {
  static var appTheme = ThemeData(
    fontFamily: _inter,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(primary: AppColors.grassGreen02),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarDividerColor: AppColors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontFamily: _inter,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
        color: AppColors.white,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(size: 20.r, color: Colors.white),
      actionsIconTheme: IconThemeData(size: 20.r),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(iconSize: 24.r),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
    ),
    iconTheme: IconThemeData(size: 24.r),
    primaryIconTheme: IconThemeData(size: 24.r),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.n979C9E,
    )
  );
}
