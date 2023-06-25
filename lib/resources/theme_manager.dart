import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/fonts-manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

import 'colors_manager.dart';

class ThemeManager {
  final SizeConfig sizeConfig = sl<SizeConfig>();

  static ThemeData get lightTheme { //1
    return ThemeData( //2
        primaryColor: ColorManager.mainColor,

        scaffoldBackgroundColor: ColorManager.mainColor,
        fontFamily: 'Inter', //3
        // buttonTheme: ButtonThemeData( // 4
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        //   buttonColor: ColorManager.blueColor,
        // ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: AppSize.s80,
            elevation: 0,
            iconTheme: IconThemeData(
              size: AppSize.s35,
              color: ColorManager.primary,
            ),
            centerTitle: true,
            // titleSpacing: 30,
            actionsIconTheme: IconThemeData(
              size: AppSize.s35,
              color:  ColorManager.primary,
            ),
            backgroundColor: ColorManager.soft,
            titleTextStyle: titleBold
        ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 30, fontFamily: FontConstants.fontFamily,fontWeight: FontWeight.w600, color: ColorManager.primary),
        headline2: TextStyle(fontSize: 20.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.w600, color: ColorManager.primary),
        headline3: TextStyle(fontSize: 15.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.w600, color: ColorManager.primary),
        headline4: TextStyle(fontSize: 16.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.w600, color: ColorManager.primary),
        headline5: TextStyle(fontSize: 13.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary ),
        headline6: TextStyle(fontSize: 13.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary),
        subtitle1: TextStyle(fontSize: 16,fontFamily:   FontConstants.fontFamily , fontWeight: FontWeight.normal, color: ColorManager.primary),
        subtitle2: TextStyle(fontSize: 20,fontFamily:    FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary),
        bodyText2: TextStyle(fontSize: 13.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary ),
        bodyText1: TextStyle(fontSize: 10.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary ),
        labelMedium: TextStyle(fontSize: 14.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          disabledBackgroundColor: ColorManager.secondGray,
          disabledForegroundColor: ColorManager.white,
          textStyle: bodyBoldWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          minimumSize: Size( AppSize.s280.w, AppSize.s56.h)
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hintStyle: bodyRegular(color: ColorManager.secondGray),
        fillColor: ColorManager.white,
        contentPadding:
        EdgeInsets.symmetric(vertical: 17.5.h ,horizontal: AppPadding.p25.w),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: ColorManager.transparent
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: ColorManager.transparent
            )
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
          borderSide: BorderSide(
            color: ColorManager.error,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
          borderSide: BorderSide(
            color: ColorManager.secondary,
            width: 1,
          ),
        ),
      )
    );
  }
}