import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/features/auth/core/auth_provider.dart';
import 'package:pet_care/features/auth/ui/screens/forget_password_screen.dart';
import 'package:pet_care/features/auth/ui/screens/main_auth_screen.dart';
import 'package:pet_care/features/auth/ui/screens/reset_password.dart';
import 'package:pet_care/features/onboarding/core/on_boarding_provider.dart';
import 'package:pet_care/features/onboarding/ui/onBoardingPage.dart';
import 'package:pet_care/features/onboarding/ui/sup_pages/first_onboarding.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/theme_manager.dart';
import 'package:pet_care/routing/route.dart';
import 'package:pet_care/routing/routes_generate.dart';
import 'package:pet_care/utils/helper.dart';
import 'package:provider/provider.dart';

import 'resources/size_config.dart';

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
        ChangeNotifierProvider.value(value: locator<AuthProvider>(),),
        ChangeNotifierProvider(create: (_) => OnBoardingProvider())
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 815),
        builder: (BuildContext context, Widget? child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeManager.lightTheme,
          scaffoldMessengerKey: Helpers.scaffoldKey,
          home:  const OnBoardingPage(),
          navigatorKey: RouteService.serviceNavi.navKey,
          onGenerateRoute: RoutsGenerate.generateRoute,
        ),
      ),
    );
  }
}

