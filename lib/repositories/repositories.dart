import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tech_test_zicare/model/profile.dart';

class UserRepository {
  static String url = "https://zpi-dev.zicare.id/";
  var urlLogin = '$url/api/v1/auth/token';
  var urlRegister = '$url/api/v1/auth/register';
  var urlGetProfile = '$url/api/v1/users/me';

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
    // print("masuk register bro");
    // print("password " + password);
    // print("full_name " + full_name);
    // print("email: " + email);
    // print("username " + username);
    Response response = await _dio.post(urlRegister, data: {
      "full_name": full_name,
      "username": username,
      "email": email,
      "password": password,
    });
    final token = await login(email, password);
    return token;
  }

  Future<UserProfile> fetchUser() async {
    var token = await storage.read(key: 'token');
    try {
      print(token);
      print("sebelum masuk dio");
      Response response = await _dio.get(urlGetProfile, options: Options(
        headers: {
          'Authorization':'Bearer $token',
        }
      ));
      print("dapet data");
      print(response.data['data']['user']);
      // return UserProfile.fromJson(response.data);
      return UserProfile.fromJson(response.data['data']['user']);
    } catch (error) {
      throw error;
    }
  }
}
