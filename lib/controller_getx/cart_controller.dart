import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController {
  var items = 1.obs;

  increment() {
    items.value++;
  }

  decrement() {
    if (items.value <= 1) {
      Get.snackbar(
        "Error",
        "Cant be smaller than 1",
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 4),
      );
    } else {
      items.value--;
    }
  }
}
