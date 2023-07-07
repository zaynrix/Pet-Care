import 'package:get_it/get_it.dart';
import 'package:pet_care/features/auth/auth_core/auth_provider.dart';
import 'package:pet_care/features/shop/controllers/product_cotroller.dart';
import 'package:pet_care/features/shop/repositories/product_repository.dart';
import 'package:pet_care/resources/size_config.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => AuthProvider());
  sl.registerLazySingleton(() => SizeConfig());
  sl.registerLazySingleton(() => ProductController());
  sl.registerLazySingleton(() => ProductRepository());
}
