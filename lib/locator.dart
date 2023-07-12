import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_care/data/remote-data/base_client.dart';
import 'package:pet_care/data/remote-data/end_point.dart';
import 'package:pet_care/features/auth/auth_core/auth_provider.dart';
import 'package:pet_care/features/shop/controllers/product_cotroller.dart';
import 'package:pet_care/features/shop/repositories/product_repository.dart';
import 'package:pet_care/resources/size_config.dart';

final sl = GetIt.instance;

void init() {

  final client =Dio()  ..options.baseUrl = Endpoints.baseUrl
    ..options.connectTimeout = const Duration(milliseconds: 15000)
    ..options.receiveTimeout = const Duration(milliseconds: 30000)
    ..options.responseType = ResponseType.json
    ..options.contentType = Headers.formUrlEncodedContentType
  // ..options.validateStatus = (statusCode) => statusCode! <= 500
  //   ..interceptors.addAll([DioInterceptor() ,
  //     dioLoggerInterceptor])
  ;

  // Dio client = Dio(
  //   BaseOptions(
  //     receiveDataWhenStatusError: true,
  //     connectTimeout: const Duration(milliseconds: 50000),
  //     receiveTimeout: const Duration(milliseconds: 50000),
  //     responseType: ResponseType.json,
  //     baseUrl: Endpoints.baseUrl,
  //     contentType: 'application/json',
  //   ),
  // );

  sl.registerLazySingleton(() => DioClient(client: client));
  sl.registerLazySingleton(() => AuthProvider());
  sl.registerLazySingleton(() => SizeConfig());
  sl.registerLazySingleton(() => ProductController());
  sl.registerLazySingleton(() => ProductRepository());
}
