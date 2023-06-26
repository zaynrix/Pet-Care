import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_care/features/add_pet/add_pet_core/add_pet_provider.dart';
import 'package:pet_care/features/add_pet/add_pet_ui/add_pet_screens/add_pet_screens.dart';
import 'package:pet_care/features/auth/auth_core/auth_provider.dart';
import 'package:pet_care/features/onboarding/core/on_boarding_provider.dart';
import 'package:pet_care/features/profile/profile_module.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/theme_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/helper.dart';
import 'package:provider/provider.dart';

import 'features/add_pet/add_pet_ui/add_pet_screens/add_pet_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await ScreenUtil.ensureScreenSize();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: sl<AuthProvider>(),
        ),
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (_) => AddPetProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 815),
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeManager.lightTheme,
          scaffoldMessengerKey: Helpers.scaffoldKey,
          home: OrderDetailScreen(),
          navigatorKey: RouteService.serviceNavi.navKey,
          onGenerateRoute: RoutsGenerate.generateRoute,
        ),
      ),
    );
  }
}

