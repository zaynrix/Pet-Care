import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_care/features/auth/auth_contoller/auth_provider.dart';
import 'package:pet_care/features/home/controllers/home_provider.dart';
import 'package:pet_care/features/notification/provider/notification_provider.dart';
import 'package:pet_care/features/onboarding/core/on_boarding_provider.dart';
import 'package:pet_care/features/shop/controllers/product_provider.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/theme_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/app_config.dart';
import 'package:pet_care/utils/helper.dart';
import 'package:provider/provider.dart';

// Commit PR
Future<void> main() async {
  await init();
  sl<NotificationProvider>().initNotification();
  sl<AppConfig>().loadData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        ChangeNotifierProvider.value(value: sl<ProductProvider>()),
        ChangeNotifierProvider.value(value: sl<AuthProvider>()),
        ChangeNotifierProvider.value(value: sl<HomeProvider>()),
        ChangeNotifierProvider.value(value: sl<NotificationProvider>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 815),
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pet Care',
          theme: ThemeManager.lightTheme,
          scaffoldMessengerKey: Helpers.scaffoldKey,
          initialRoute: RouteGenerator.splashScreen,
          navigatorKey: RouteService.serviceNavi.navKey,
          onGenerateRoute: RoutsGenerate.generateRoute,
        ),
      ),
    );
  }
}
