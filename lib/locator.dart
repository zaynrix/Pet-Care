import 'package:get_it/get_it.dart';
import 'package:pet_care/features/auth/core/auth_provider.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => AuthProvider());
}
