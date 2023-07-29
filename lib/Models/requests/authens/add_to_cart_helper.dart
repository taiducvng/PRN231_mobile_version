import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaithuhay_clone/Models/all_product_models.dart';
import 'package:vaithuhay_clone/Models/requests/authens/add_to_cart_model.dart';

class AddToCartService {
  static Future<bool> addToCart(AddToCartModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("accessToken");
    print("$token");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var Client = http.Client();

    var uri = Uri.parse("http://18.143.102.131:44391/api/cart/create");
    var response = await Client.post(
      uri,
      headers: requestHeaders,
      body: jsonEncode(model),
    );
    if (response.statusCode == 200) {
      Get.snackbar(
        "Items added successfully",
        "Check your cart to proceed payment",
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 4),
      );
      print("hehe");
      return true;
    } else {
      Get.snackbar(
        "Items added failed",
        "Check your API LUL",
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 2),
      );
      print("error");
      throw Exception('Failed to load ');
    }
  }
}
