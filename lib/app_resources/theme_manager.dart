
import 'package:flutter/material.dart';
import 'package:untitled/app_resources/color_manager.dart';
import 'package:untitled/app_resources/style_manager.dart';
import 'package:untitled/app_resources/values_manager.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme() {
  /**
   * Theme Data
   */
  return ThemeData(
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primary,
      disabledColor: ColorManager.fadedGrey,
      splashColor: ColorManager.darkGrey,
      //Ripple Effect
      /**
       * card Theme
       */
      cardTheme: CardTheme(color: ColorManager.fadedGrey, elevation: AppSizes.s8),
      /**
       * AppBar Theme
       */
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSizes.s8,
          titleTextStyle: getBoldStyle(color: ColorManager.primary)),
      /**
       * Button Theme wether normal or elevated Theme
       */
      buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.darkGrey,
        splashColor: ColorManager.primary,
        buttonColor: ColorManager.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s12),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.s12))),
      ),
      /**
       * Text Theme
       */
      textTheme: TextTheme(
        headline1: getSemiBoldStyle(color: ColorManager.primary, fontSize: AppSizes.s16),
        headlineLarge: getSemiBoldStyle(color: ColorManager.primary),
        subtitle1: getLightStyle(color: ColorManager.primary, fontSize: AppSizes.s12),
        caption: getLightStyle(color: ColorManager.primary, fontSize: AppSizes.s12),
        bodyText1:
            getLightStyle(color: ColorManager.primary, fontSize: AppSizes.s12),
      ),
      /**
       * InputDecoration Theme
       */
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(AppPaddings.p8),
          hintStyle: getLightStyle(
              color: ColorManager.darkGrey, fontSize: AppSizes.s8),
          labelStyle: getLightStyle(
              color: ColorManager.darkGrey, fontSize: AppSizes.s8),
          errorStyle: getLightStyle(
              color: ColorManager.redColor, fontSize: AppSizes.s8),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.fadedGrey, width: AppSizes.s8),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSizes.s8))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.darkGrey, width: AppSizes.s8),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSizes.s8))),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.redColor, width: AppSizes.s8),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSizes.s8))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSizes.s8),
            borderRadius:
            const BorderRadius.all(Radius.circular(AppSizes.s8))),

      ));
}
