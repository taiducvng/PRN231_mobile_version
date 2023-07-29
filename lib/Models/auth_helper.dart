import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaithuhay_clone/Models/requests/authens/login_model.dart';
import 'package:vaithuhay_clone/Models/requests/authens/signup_model.dart';
import 'package:vaithuhay_clone/Models/responses/login_response_model.dart';
import 'package:vaithuhay_clone/login_screen.dart';

import '../home_screen.dart';

class AuthHelper {
  static var client = https.Client();
  static Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.parse("http://18.143.102.131:44391/api/account/CasualLogin");
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );
    if (response.statusCode == 200 && response.contentLength! > 105) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String accessToken =
          loginResponseModelFromJson(response.body).data.accessToken;
      String name = loginResponseModelFromJson(response.body).data.name;
      int roles = loginResponseModelFromJson(response.body).data.roles;
      await prefs.setString("accessToken", accessToken);
      await prefs.setString("name", name);
      await prefs.setInt("role", roles);
      print(prefs.getString("accessToken"));
      Get.off(() => const HomeScreen());
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> register(SignupModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.parse("http://18.143.102.131:44391/api/account/Create");
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );
    if (response.statusCode == 200) {
      Get.off(() => const LoginScreen());
      return true;
    } else {
      return false;
    }
  }
}
