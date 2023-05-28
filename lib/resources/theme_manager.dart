import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/resources/fonts-manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

import 'colors_manager.dart';

class ThemeManager {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
        primaryColor: ColorManager.mainColor,

        scaffoldBackgroundColor: ColorManager.mainColor,
        fontFamily: 'Inter', //3
        buttonTheme: ButtonThemeData( // 4
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: ColorManager.blueColor,
        ),
        appBarTheme:   AppBarTheme(
          toolbarHeight: AppSize.s58,
            elevation: 0,
            iconTheme: const IconThemeData(
              size: AppSize.s35,
              color: ColorManager.primaryFontColor,
            ),
            centerTitle: true,
            // titleSpacing: 30,
            actionsIconTheme: const IconThemeData(
              size: AppSize.s35,
              color:  ColorManager.primaryFontColor,
            ),
            backgroundColor: ColorManager.soft,
            titleTextStyle: titleBold(color: ColorManager.primary)
        ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 30, fontFamily: FontConstants.fontFamily,fontWeight: FontWeight.w600, color: ColorManager.primaryFontColor),
        headline2: TextStyle(fontSize: 20.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.w600, color: ColorManager.primaryFontColor),
        headline3: TextStyle(fontSize: 15.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.w600, color: ColorManager.primaryFontColor),
        headline4: TextStyle(fontSize: 16.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.w600, color: ColorManager.thirdFontColor),
        headline5: TextStyle(fontSize: 13.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.blackColor ),
        headline6: TextStyle(fontSize: 13.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.thirdFontColor),
        subtitle1: TextStyle(fontSize: 16,fontFamily:   FontConstants.fontFamily , fontWeight: FontWeight.normal, color: ColorManager.secondaryFontColor),
        subtitle2: TextStyle(fontSize: 20,fontFamily:    FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.secondaryFontColor),
        bodyText2: TextStyle(fontSize: 13.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.secondaryFontColor ),
        bodyText1: TextStyle(fontSize: 10.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.anotherFontColor ),
        labelMedium: TextStyle(fontSize: 14.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.labelFontColor ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          disabledBackgroundColor: ColorManager.secondGray,
          disabledForegroundColor: ColorManager.white,
          textStyle: bodyBold(color: ColorManager.white),
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