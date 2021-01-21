import 'package:flutter/widgets.dart';
import 'package:getconnect_auth_flow/statemanagement/statemanagement.dart';

import '../pages.dart';

class Register extends StatelessWidget {
  const Register({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Auth(
      title: 'Register',
      authState: AuthState.REGISTER,
    );
  }
}
