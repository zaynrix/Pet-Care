import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/values_manager.dart';

import 'fonts-manager.dart';

const TextStyle h1Bold = TextStyle(
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s40,
    color: ColorManager.primary,
    height: 1.075);

const TextStyle h2Bold = TextStyle(
    color: ColorManager.primary,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s32);

// const TextStyle h2Regular = TextStyle(
//     fontWeight: FontWeightManager.regular,
//     fontFamily: FontConstants.fontFamily,
//     fontSize: FontSize.s32);

const TextStyle h3Bold = TextStyle(
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s24,
    color: ColorManager.primary,
    height: AppSize.s1_3);

TextStyle h3BoldWithOpacity = TextStyle(
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s24,
    color: ColorManager.primary.withOpacity(0.5),
    height: AppSize.s1_3);

const TextStyle h3Medium = TextStyle(
    color: ColorManager.primary,
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s24,
    height: AppSize.s1_3);
const TextStyle h3Medium2 = TextStyle(
    color: ColorManager.gray,
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s24,
    height: AppSize.s1_3);
const TextStyle titleRegular = TextStyle(
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s20,
    color: ColorManager.primary,
    height: 1.35);

const TextStyle titleSemiBoldSecondary = TextStyle(
    color: ColorManager.secondary,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s20,
    height: 1.35);

const TextStyle titleSemiBoldPrimary = TextStyle(
    color: ColorManager.primary,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s20,
    height: 1.35);

const TextStyle titleBold = TextStyle(
    color: ColorManager.primary,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s20,
    height: 1.35);

const TextStyle supTitleRegular = TextStyle(
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s18,
    color: ColorManager.primary,
    height: AppSize.s1_3);

const TextStyle supTitleSemiBold = TextStyle(
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s18,
    color: ColorManager.primary,
    height: AppSize.s1_3);

const TextStyle supTitleBold = TextStyle(
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s18,
    color: ColorManager.primary,
    height: AppSize.s1_3);

const TextStyle supTitleMedium = TextStyle(
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s18,
    color: ColorManager.primary,
    height: AppSize.s1_3);

// const TextStyle bodyRegular = TextStyle(
//     fontWeight: FontWeightManager.regular,
//     fontFamily: FontConstants.fontFamily,
//     fontSize: FontSize.s15,
//     height: 1.4);

const TextStyle bodyBoldSecondary = TextStyle(
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    color: ColorManager.secondary,
    fontSize: FontSize.s15,
    height: 1.4);

const TextStyle bodyBoldPrimary = TextStyle(
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    color: ColorManager.primary,
    fontSize: FontSize.s15,
    height: 1.4);

const TextStyle bodyBoldWhite = TextStyle(
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    color: ColorManager.white,
    fontSize: FontSize.s15,
    height: 1.4);

const TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s15,
    color: ColorManager.primary,
    height: 1.4);

// const TextStyle footNoteRegular = TextStyle(
//     fontWeight: FontWeightManager.regular,
//     fontFamily: FontConstants.fontFamily,
//     fontSize: FontSize.s13,
//     height: 1.38);

const TextStyle oldPriceStyle = TextStyle(
    color: ColorManager.gray,
    fontSize: AppSize.s9,
    fontWeight: FontWeightManager.regular,
    decoration: TextDecoration.lineThrough,
    fontFamily: FontConstants.fontFamily);

const TextStyle footNoteBold = TextStyle(
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s13,
    color: ColorManager.primary,
    height: 1.38);
// //
// const TextStyle footNoteSemiBold = TextStyle(
//     fontWeight: FontWeightManager.semiBold,
//     fontFamily: FontConstants.fontFamily,
//     fontSize: FontSize.s13,
//     color: ColorManager.primary,
//     height: 1.38);
//
// const TextStyle footNoteSemiBoldSecondary = TextStyle(
//     fontWeight: FontWeightManager.semiBold,
//     fontFamily: FontConstants.fontFamily,
//     fontSize: FontSize.s13,
//     color: ColorManager.secondary,
//     height: 1.38);

const TextStyle captionRegular = TextStyle(
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s11,
    color: ColorManager.gray,
    height: 1.45);

const TextStyle captionRegularLine = TextStyle(
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s11,
    color: ColorManager.gray,
    decoration: TextDecoration.lineThrough,
    height: 1.45);
const TextStyle captionRegularPrimary = TextStyle(
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s11,
    color: ColorManager.primary,
    height: 1.45);

const TextStyle captionMedium = TextStyle(
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s11,
    color: ColorManager.primary,
    height: 1.45);

const TextStyle captionBold = TextStyle(
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s11,
    color: ColorManager.primary,
    height: 1.45);

const TextStyle captionSemiBold = TextStyle(
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.fontFamily,
    fontSize: FontSize.s11,
    color: ColorManager.primary,
    height: 1.45);

// TextStyle h1Bold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.bold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s40.sp,
//       height: 1.075);
// }

// TextStyle h2Bold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.bold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s32.sp);
// }

TextStyle h2Regular({required Color color}) {
  return TextStyle(
      color: color,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.fontFamily,
      fontSize: FontSize.s32.sp);
}

// TextStyle h3Bold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.bold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s24.sp,
//       height: AppSize.s1_3);
// }

// TextStyle h3Medium({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.medium,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s24.sp,
//       height: AppSize.s1_3);
// }

// TextStyle titleRegular({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.regular,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s20.sp,
//       height: 1.35);
// }

// TextStyle titleSemiBold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.semiBold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s20.sp,
//       height: 1.35);
// }
//
// TextStyle titleBold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.bold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s20.sp,
//       height: 1.35);
// }
//
// TextStyle supTitleRegular({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.regular,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s18.sp,
//       height: AppSize.s1_3);
// }
//
// TextStyle supTitleSemiBold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.semiBold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s18.sp,
//       height: AppSize.s1_3);
// }
//
// TextStyle supTitleBold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.bold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s18.sp,
//       height: AppSize.s1_3);
// }
//
// TextStyle supTitleMedium({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.medium,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s18.sp,
//       height: AppSize.s1_3);
// }

TextStyle bodyRegular({required Color color}) {
  return TextStyle(
      color: color,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.fontFamily,
      fontSize: FontSize.s15.sp,
      height: 1.4);
}
//
// TextStyle bodyBold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.bold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s15.sp,
//       height: 1.4);
// }
//
// TextStyle bodyMedium({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.medium,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s15.sp,
//       height: 1.4);
// }

TextStyle footNoteRegular({required Color color}) {
  return TextStyle(
      color: color,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.fontFamily,
      fontSize: FontSize.s13.sp,
      height: 1.38);
}

TextStyle footNoteSemiBold({required Color color}) {
  return TextStyle(
      fontWeight: FontWeightManager.semiBold,
      fontFamily: FontConstants.fontFamily,
      fontSize: FontSize.s13,
      color: color,
      height: 1.38);
}

// TextStyle footNoteSemiBold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.semiBold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s13.sp,
//       height: 1.38);
// }
//
// TextStyle footNoteBold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.bold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s13.sp,
//       height: 1.38);
// }
//
// TextStyle captionRegular({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.regular,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s11.sp,
//       height: 1.45);
// }
//
// TextStyle captionBold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.bold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s11.sp,
//       height: 1.45);
// }
//
// TextStyle captionSemiBold({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.semiBold,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s11.sp,
//       height: 1.45);
// }
//
// TextStyle captionMedium({required Color color}) {
//   return TextStyle(
//       color: color,
//       fontWeight: FontWeightManager.medium,
//       fontFamily: FontConstants.fontFamily,
//       fontSize: FontSize.s11.sp,
//       height: 1.45);
// }
