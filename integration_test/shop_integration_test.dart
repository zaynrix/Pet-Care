import 'dart:io';

import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
void main(){
  final binding = IntegrationTestWidgetsFlutterBinding();

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  takeScreenshot(tester, binding, name) async {
    if (Platform.isAndroid) {
      try {
        await binding.convertFlutterSurfaceToImage();
      } catch (e) {
        debugPrint("TakeScreenshot exception $e");
      }
      await tester.pumpAndSettle();
    }

    await binding.takeScreenshot(name);
  }
}