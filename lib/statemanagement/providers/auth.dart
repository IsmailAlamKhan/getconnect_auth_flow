import 'dart:developer';

import 'package:get/get.dart';
import 'package:getconnect_auth_flow/api_url.dart';
import 'package:getconnect_auth_flow/statemanagement/statemanagement.dart';

enum AuthState { LOGIN, REGISTER }

extension ExtendedAuthState on AuthState {
  bool get login => this == AuthState.LOGIN;
  bool get register => this == AuthState.REGISTER;
}

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) => AuthResponse.fromJson(map);
    httpClient.baseUrl = BASEURL;
  }

  Future<String> auth(
    AuthState authState, {
    String password,
    String email,
    String firstName,
    String lastName,
    String phoneNumber,
    int role,
  }) async {
    Response res;
    String _return;
    switch (authState) {
      case AuthState.LOGIN:
        final _body = {
          'email': email,
          'password': password,
        };
        res = await post(LOGIN_URL, _body);
        _return = 'Successfully Logged In';
        break;
      case AuthState.REGISTER:
        final _body = {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "phoneNumber": phoneNumber,
          "role": role,
        };
        res = await post(SIGNUP_URL, _body);
        _return = 'Successfully Sigged In';
        break;
      default:
    }
    if (res.hasError) {
      if (res.status.isNotFound) {
        return Future.error(res.statusText);
      } else {
        return Future.error(res.body['message']);
      }
    } else {
      return _return;
    }
  }
}
