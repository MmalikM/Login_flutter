import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  static String url = "https://zpi-dev.zicare.id/";
  var urlLogin = '$url/api/v1/auth/token';
  var urlRegister = '$url/api/v1/auth/register';

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String email, String password) async {
    Response response = await _dio.post(urlLogin, data: {
      "username": email,
      "password": password,
      "grant_type": "password"
    });
    return response.data['access_token'];
  }

  Future<String> register(
      String full_name, String username, String email, String password) async {
    print("masuk register bro");
    print("password " + password);
    print("full_name " + full_name);
    print("email: " + email);
    print("username " + username);
    Response response = await _dio.post(urlRegister, data: {
      "full_name": full_name,
      "username": username,
      "email": email,
      "password": password,
    });

    final token = await login(email, password);
    return token;
  
  
  }
}
