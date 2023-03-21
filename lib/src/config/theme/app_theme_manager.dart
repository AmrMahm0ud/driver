import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    fontFamily: FontConstants.fontFamilyEn,
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.primaryDisabled,
    splashColor: ColorManager.white,
    toggleableActiveColor: ColorManager.primary,
    unselectedWidgetColor: ColorManager.white,
    cardTheme: const CardTheme(
      color: ColorManager.white,
      elevation: AppSize.s3,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s0,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: ColorManager.black),
      titleTextStyle: getBoldStyle(
        fontSize: FontSize.s24,
        color: ColorManager.darkGray,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
            side: const BorderSide(color: ColorManager.primary),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(ColorManager.primary),
        textStyle: MaterialStateProperty.all<TextStyle>(
          getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge:
          getBoldStyle(color: ColorManager.darkGray, fontSize: FontSize.s24),
      headlineMedium:
          getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
      bodyMedium:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.lightGrey, width: AppSize.s1),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s10),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s10),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s10),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s10),
        ),
      ),
      alignLabelWithHint: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
      elevation: AppSize.s4,
      selectedIconTheme: const IconThemeData(
        color: ColorManager.primary,
        size: AppSize.s24,
      ),
      unselectedIconTheme: const IconThemeData(
        color: ColorManager.grey,
        size: AppSize.s24,
      ),
      selectedLabelStyle: getRegularStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s12,
      ),
      unselectedLabelStyle: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s12,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      elevation: AppSize.s3,
      backgroundColor: ColorManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s24),
          topRight: Radius.circular(AppSize.s24),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
    ),
  );
}
