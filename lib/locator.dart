import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_care/data/local_data/storage_service.dart';
import 'package:pet_care/data/remote-data/base_client.dart';
import 'package:pet_care/data/remote-data/end_point.dart';
import 'package:pet_care/data/remote-data/interceptors/logger_interceptor.dart';
import 'package:pet_care/features/auth/auth_contoller/auth_provider.dart';
import 'package:pet_care/features/auth/auth_repo/auth_repo.dart';
import 'package:pet_care/features/home/controllers/home_provider.dart';
import 'package:pet_care/features/home/controllers/search_provider.dart';
import 'package:pet_care/features/home/repositories/home_repo.dart';
import 'package:pet_care/features/shop/controllers/product_cotroller.dart';
import 'package:pet_care/features/shop/repositories/product_repository.dart';
import 'package:pet_care/resources/size_config.dart';

import 'data/remote-data/interceptors/dio_interceptor.dart';

final sl = GetIt.instance;

void init() {

  //----------------------------setupDioInstance--------------------------------
  final client = Dio()
    ..options.baseUrl = Endpoints.baseUrl
    ..options.connectTimeout = const Duration(milliseconds: 30000)
    ..options.receiveTimeout = const Duration(milliseconds: 30000)
    ..options.responseType = ResponseType.json
    ..options.contentType = Headers.formUrlEncodedContentType
    ..interceptors
        .addAll([DioInterceptor(), if (kDebugMode) LoggerInterceptor()]);

  //---------------------------setupSecureStorage-------------------------------

  const secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => StorageService(secureStorage));
  
  sl.registerLazySingleton(() => DioClient(client: client));
  sl.registerLazySingleton(() => AuthProvider(sl<AuthRepo>()));
  sl.registerLazySingleton(() => AuthRepo(client: sl<DioClient>()));
  sl.registerLazySingleton(() => SizeConfig());
  sl.registerLazySingleton(() => ProductController());
  sl.registerLazySingleton(() => ProductRepository());
  sl.registerLazySingleton(() => HomeProvider());
  sl.registerLazySingleton(() => SearchProvider());
  sl.registerLazySingleton(() => HomeRepository());
}
