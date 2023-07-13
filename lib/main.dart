import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_care/data/local_data/hive_service.dart';
import 'package:pet_care/features/add_pet/add_pet_core/add_pet_provider.dart';
import 'package:pet_care/features/article/article_module.dart';
import 'package:pet_care/features/auth/auth_core/auth_provider.dart';
import 'package:pet_care/features/auth/auth_ui/screens/auth_module.dart';
import 'package:pet_care/features/location/location_module.dart';
import 'package:pet_care/features/onboarding/core/on_boarding_provider.dart';
import 'package:pet_care/features/profile/profile_module.dart';
import 'package:pet_care/features/reminder/reminder_module.dart';
import 'package:pet_care/features/shop/controllers/product_cotroller.dart';
import 'package:pet_care/features/shop/ui/screens/shop_screens.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/theme_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/helper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // HiveService.initHive();
  await ScreenUtil.ensureScreenSize();
  init();
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
        ChangeNotifierProvider.value(value: sl<ProductController>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 815),
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeManager.lightTheme,
          scaffoldMessengerKey: Helpers.scaffoldKey,
          home: ArticleDetail(),
          navigatorKey: RouteService.serviceNavi.navKey,
          onGenerateRoute: RoutsGenerate.generateRoute,
        ),
      ),
    );
  }
}
