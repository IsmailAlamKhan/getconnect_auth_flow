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

  final TextEditingController firstNameTEC =
      TextEditingController(text: 'Md Ismail Alam');
  final TextEditingController lastNameTEC =
      TextEditingController(text: 'Md Ismail Alam Khan');
  final TextEditingController emailTEC = TextEditingController(
    text: 'test@test.com',
  );
  final TextEditingController passTEC = TextEditingController(
    text: '123456',
  );
  final TextEditingController phoneNumberTEC = TextEditingController(
    text: '01234567890',
  );
  String get email => emailTEC.text;
  String get password => passTEC.text;
  String get firstName => firstNameTEC.text;
  String get lastName => lastNameTEC.text;
  String get phoneNumber => phoneNumberTEC.text;
}
