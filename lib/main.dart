import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getconnect_auth_flow/statemanagement/controller/auth.dart';

import 'statemanagement/statemanagement.dart';
import 'ui/pages/auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: BindingsBuilder(
        () {
          Get.put(AuthProvider());
          Get.put(AuthController());
        },
      ),
      home: Login(),
    );
  }
}
//* get generate model with assets/auth_response.json
