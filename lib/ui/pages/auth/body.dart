import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getconnect_auth_flow/consts.dart';

import 'package:getconnect_auth_flow/statemanagement/statemanagement.dart';
import 'package:getconnect_auth_flow/ui/pages/auth/inputs.dart';
import 'package:getconnect_auth_flow/ui/pages/auth/register.dart';

class Auth extends GetView<AuthController> {
  Auth({
    Key key,
    @required this.title,
    @required this.authState,
  }) : super(key: key);
  final String title;
  final AuthState authState;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Inputs(
                authState: authState,
                controller: controller,
              ),
              20.0.sizedHeight,
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    showErrorSnackBar('Please validate all the fields');
                  } else {
                    controller.auth(authState);
                  }
                },
                child: Text(title),
              ),
              authState == AuthState.LOGIN
                  ? Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to(Register());
                          },
                          child: Text('Don\'t have an account? Signin'),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
