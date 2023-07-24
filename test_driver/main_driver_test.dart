import 'dart:io';

import 'package:flutter/material.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  try {
    await integrationDriver(
      onScreenshot: (String screenshotName, List<int> screenshotBytes , [Map<String, Object?>? map]) async {
        final File image = await File('screenshots/$screenshotName.png').create(recursive: true);

        image.writeAsBytesSync(screenshotBytes);
        return true;
      },
    );
  } catch (e) {
    debugPrint('onScreenshot - error - $e');
  }
}