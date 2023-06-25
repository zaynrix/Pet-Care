import 'package:flutter/material.dart';
import 'package:pet_care/utils/helper.dart';

class SizeConfig {

  static final MediaQueryData mediaQueryData = MediaQuery.of(Helpers.scaffoldKey.currentState!.context);
  static final double screenDeviceWidth = mediaQueryData.size.width;
  static final double screenDeviceHeight = mediaQueryData.size.height;

  double getScreenHeight(double inputHeight) {
    double screenHeight = screenDeviceHeight;
    return (inputHeight / 815.0) * screenHeight;
  }

// Get the proportionate height as per screen size
  double getScreenWidth(double inputWidth) {
    double screenWidth = screenDeviceWidth;
    return (inputWidth / 375.0) * screenWidth;
  }
}