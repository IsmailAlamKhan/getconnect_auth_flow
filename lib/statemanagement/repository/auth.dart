import 'package:get/get.dart';

import '../statemanagement.dart';

class AuthRepository {
  final provider = Get.find<AuthProvider>();

  Future<AuthResponse> login(
    String email,
    String password,
  ) {
    //return Auth from provider
  }
  Future<AuthResponse> register(
    String firstName,
    String lastName,
    String email,
    String password,
    String phoneNumber,
    int role,
  ) {
    //return Auth from provider
  }
}
