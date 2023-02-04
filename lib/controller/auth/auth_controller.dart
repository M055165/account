import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _storage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    _storage.write(key: 'user', value: 'eddie');
  }

  Future<String?> getStoredUser() async => _storage.read(key: 'user');

  Future<LoginResult> login({
    required String user,
    required String password,
  }) async {
    try {
      if (user == 'eddie' && password == 'eddie') {
        _storage.write(key: 'user', value: user);
        return LoginResult.success;
      }
      return LoginResult.userOrPasswordInvalid;
    } catch (e) {
      return LoginResult.userOrPasswordInvalid;
    }
  }
}

enum LoginResult {
  success,
  userOrPasswordInvalid,
  disabled,
  locked,
  notAuthorized,
  passwordExpired,
  serverError,
  unknown,
}
