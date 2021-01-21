import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getconnect_auth_flow/statemanagement/statemanagement.dart';

class AuthController extends GetxController {
  final _role = Role().obs;
  Role get role => _role.value;
  set role(Role newValue) => _role(newValue);
  final _obscure = true.obs;
  bool get obscure => _obscure.value;
  set obscure(bool value) => _obscure(value);

  final TextEditingController firstNameTEC = TextEditingController();
  final TextEditingController lastNameTEC = TextEditingController();
  final TextEditingController emailTEC = TextEditingController(
    text: 'test@test.com',
  );
  final TextEditingController passTEC = TextEditingController(
    text: '123456',
  );
  final TextEditingController phoneNumberTEC = TextEditingController();
  String get email => emailTEC.text;
  String get password => passTEC.text;
  String get firstName => firstNameTEC.text;
  String get lastName => lastNameTEC.text;
  String get phoneNumber => phoneNumberTEC.text;
}

void showErrorSnackBar(String e) {
  Get.rawSnackbar(
    snackStyle: SnackStyle.GROUNDED,
    backgroundColor: Colors.red,
    borderRadius: 5,
    messageText: Text(
      e ?? '',
      maxLines: 30,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeInOut,
    barBlur: 20,
    snackPosition: SnackPosition.TOP,
    margin: EdgeInsets.zero,
  );
}

void showSuccessSnackBar(String body) {
  Get.rawSnackbar(
    snackStyle: SnackStyle.GROUNDED,
    backgroundColor: Colors.green,
    snackPosition: SnackPosition.TOP,
    borderRadius: 5,
    messageText: Text(
      body ?? '',
      maxLines: 30,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeInOut,
    barBlur: 20,
    margin: EdgeInsets.zero,
  );
}
