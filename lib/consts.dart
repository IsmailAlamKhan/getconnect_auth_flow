import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
