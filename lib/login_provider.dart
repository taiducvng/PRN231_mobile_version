import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaithuhay_clone/Models/requests/authens/add_to_cart_model.dart';
import 'package:vaithuhay_clone/home_screen.dart';
import 'package:vaithuhay_clone/login_screen.dart';

import 'Models/auth_helper.dart';
import 'Models/requests/authens/add_to_cart_helper.dart';
import 'Models/requests/authens/login_model.dart';
import 'Models/requests/authens/signup_model.dart';
import 'constants/app_constants.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  userLogin(LoginModel model) {
    AuthHelper.login(model).then((response) {
      if (response) {
        // } else if (response && firstTime) {
        // Get.off(() => const HomeScreen());
      } else if (!response) {
        Get.snackbar("Sign failed", "Please check your credentials",
            colorText: Color(kLight.value),
            backgroundColor: Colors.red,
            icon: Icon(Icons.add_alert));
      }
    });
  }

  userSignup(SignupModel model) {
    AuthHelper.register(model).then((response) {
      if (response) {
        Get.snackbar(
          "Sign good",
          "Please logins",
        );
        // } else if (response && firstTime) {
        // Get.off(() => const LoginScreen());
      } else if (!response) {
        Get.snackbar("Sign failed", "Please check your credentials",
            colorText: Color(kLight.value),
            backgroundColor: Colors.red,
            icon: Icon(Icons.add_alert));
      }
    });
  }
}
