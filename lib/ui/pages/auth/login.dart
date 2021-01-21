import 'package:flutter/widgets.dart';
import 'package:getconnect_auth_flow/statemanagement/providers/providers.dart';

import '../pages.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Auth(
      title: 'Login',
      authState: AuthState.LOGIN,
    );
  }
}
