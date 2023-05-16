

import 'package:tech_test_zicare/model/profile.dart';
import 'repositories.dart';

class GetUser{
  final userRepository = UserRepository();
  
  Future<UserProfile> fetchUser(){
    return userRepository.fetchUser();
  }
}

class NetworkError extends Error {}
