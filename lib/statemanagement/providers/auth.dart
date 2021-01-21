import 'package:get/get.dart';
import 'package:getconnect_auth_flow/api_url.dart';

import 'package:getconnect_auth_flow/statemanagement/statemanagement.dart';

enum AuthState { LOGIN, REGISTER }

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => AuthResponse.fromJson(map);
    httpClient.baseUrl = BASEURL;
  }

  Future<Response<AuthResponse>> getAuthResponse(int id) async =>
      await get('authresponse/$id');
  Future<Response<AuthResponse>> postAuthResponse(
          AuthResponse authresponse) async =>
      await post('authresponse', authresponse);
  Future<Response> deleteAuthResponse(int id) async =>
      await delete('authresponse/$id');
}
