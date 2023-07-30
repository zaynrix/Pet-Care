import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_care/data/local_data/storage_service.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/routing/routing_module.dart';

class AppConfig extends ChangeNotifier {
  var shared = sl<StorageService>();

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    if (shared.accessToken == "") {
      RouteService.serviceNavi
          .pushNamedAndRemoveUtils(RouteGenerator.mainAuthScreen);
    } else {
      RouteService.serviceNavi
          .pushNamedAndRemoveUtils(RouteGenerator.mainScreenApp);
    }
  }
}
