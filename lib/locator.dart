import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_care/data/local_data/storage_service.dart';
import 'package:pet_care/data/remote-data/base_client.dart';
import 'package:pet_care/data/remote-data/end_point.dart';
import 'package:pet_care/data/remote-data/interceptors/logger_interceptor.dart';
import 'package:pet_care/features/add_pet/add_pet_controller/add_pet_controller.dart';
import 'package:pet_care/features/article/article_module.dart';
import 'package:pet_care/features/auth/auth_contoller/auth_provider.dart';
import 'package:pet_care/features/auth/auth_repo/auth_repo.dart';
import 'package:pet_care/features/home/controllers/home_provider.dart';
import 'package:pet_care/features/home/controllers/search_provider.dart';
import 'package:pet_care/features/home/repositories/home_repo.dart';
import 'package:pet_care/features/location/controller/address_provider.dart';
import 'package:pet_care/features/location/repositories/address_repositories.dart';
import 'package:pet_care/features/notification/provider/notification_provider.dart';
import 'package:pet_care/features/pets/pets_module.dart';
import 'package:pet_care/features/shop/controllers/card_provider.dart';
import 'package:pet_care/features/shop/controllers/order_Inforamtion_provider.dart';
import 'package:pet_care/features/shop/controllers/product_provider.dart';
import 'package:pet_care/features/shop/repositories/product_repository.dart';
import 'package:pet_care/features/vets/vets_module.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/utils/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/remote-data/interceptors/dio_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await ScreenUtil.ensureScreenSize();
  //---------------------------- Setup Dio Instance --------------------------------
  final client = Dio()
    ..options.baseUrl = Endpoints.baseUrl
    ..options.connectTimeout = const Duration(milliseconds: 30000)
    ..options.receiveTimeout = const Duration(milliseconds: 30000)
    ..options.responseType = ResponseType.json
    ..options.contentType = Headers.formUrlEncodedContentType
    ..interceptors
        .addAll([DioInterceptor(), if (kDebugMode) LoggerInterceptor()]);

  //--------------------------- Setup Secure Storage -------------------------------

  final sharedPreferences = await SharedPreferences.getInstance();
  final awesomeNotifications = AwesomeNotifications();
  ;
  sl.registerLazySingleton(() => StorageService(sharedPreferences));
  sl.registerLazySingleton(() => awesomeNotifications);

  sl.registerLazySingleton(() => DioClient(client: client));
  sl.registerLazySingleton(() => SizeConfig());
  sl.registerLazySingleton(() => AuthProvider());
  sl.registerLazySingleton(() => AuthRepo(client: sl<DioClient>()));
  sl.registerLazySingleton(() => ProductProvider());
  sl.registerLazySingleton(() => ProductRepository());
  sl.registerLazySingleton(() => HomeProvider());
  sl.registerLazySingleton(() => HomeRepository());
  sl.registerLazySingleton(() => SearchProvider());
  sl.registerLazySingleton(() => AddressProvider());
  sl.registerLazySingleton(() => AddressRepository());
  sl.registerLazySingleton(() => CardProvider());

  sl.registerLazySingleton(() => AddPetController());

  sl.registerLazySingleton(() => OrderInformationProvide());
  sl.registerLazySingleton(() => PetRepo());
  sl.registerLazySingleton(() => AppConfig());
  sl.registerLazySingleton(() => PetsController(petRepo: sl<PetRepo>()));
  sl.registerLazySingleton(() => NotificationProvider()..initNotification());

  // sl.registerLazySingleton(() => VetsRepo());
  // sl.unregister<ArticleController>();
}

initPets() {
  if (!sl.isRegistered<ArticleRepo>()) {
    sl.registerLazySingleton(() => PetRepo());
  }
  if (!Get.isRegistered<ArticleController>()) {
    sl.registerLazySingleton(() => ArticleController());
  }
}

initArticle() {
  if (!sl.isRegistered<ArticleRepo>()) {
    sl.registerLazySingleton(() => ArticleRepo());
  }
  if (!sl.isRegistered<ArticleController>()) {
    sl.registerLazySingleton(() => ArticleController());
  }
}

disposeArticle() {
  if (sl.isRegistered<ArticleRepo>()) {
    sl.unregister<ArticleRepo>();
  }
  if (sl.isRegistered<ArticleController>()) {
    sl.unregister<ArticleController>();
  }
}

initVets() {
  disposeArticle();
  if (!sl.isRegistered<VetsRepo>()) {
    sl.registerLazySingleton(() => VetsRepo());
  }
  if (!Get.isRegistered<VetsController>()) {
    Get.put(VetsController(repo: sl<VetsRepo>()), permanent: true);
  }
}

disposeVets() {
  Get.delete<VetsController>();
  sl.unregister<VetsRepo>();
}
