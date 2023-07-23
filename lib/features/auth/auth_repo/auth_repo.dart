import 'package:pet_care/data/local_data/storage_service.dart';
import 'package:pet_care/data/remote-data/base_client.dart';
import 'package:pet_care/data/remote-data/end_point.dart';
import 'package:pet_care/features/auth/auth_model/user_model.dart';
import 'package:pet_care/locator.dart';

class AuthRepo {
  AuthRepo({required this.client});

  final DioClient client;

  Future<UserModel> loginRepo(
      {required String email, required String password}) async {
    final response = await client
        .post(Endpoints.login, data: {"email": email, "password": password});
    sl<StorageService>().saveAccessToken(token: response.data["tokens"]["access_token"]);
    final user =UserModel.fromJsom(response.data["user"]);
    return user;
  }

}
