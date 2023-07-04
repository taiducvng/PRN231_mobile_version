import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vaithuhay_clone/app_style.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';
import 'package:vaithuhay_clone/constants/custom_textfield.dart';
import 'package:vaithuhay_clone/custom_btn_1.dart';
import 'package:vaithuhay_clone/login_provider.dart';
import 'package:vaithuhay_clone/register_screen.dart';
import 'package:vaithuhay_clone/reusable_text.dart';

import 'custom_btn.dart';

class RegisterContent extends StatefulWidget {
  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReusableText(
                    text: "ĐĂNG KÝ",
                    style: appstyle(32, Color(kDark.value), FontWeight.bold),
                  ),
                  Column(
                    children: [
                      ReusableText(
                          text: "Khách hàng đã mua hàng có thể tích điểm",
                          style: appstyle(
                              18, Color(kLightBlue.value), FontWeight.w400))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(
                          24.0), // Adjust the value as desired
                      child: CustomTextField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "   Email or mobile number",
                        validator: (email) {
                          if (email!.isEmpty || !email.contains("@")) {
                            return "Enter a valid email";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          24.0), // Adjust the value as desired
                      child: CustomTextField(
                        controller: password,
                        keyboardType: TextInputType.text,
                        obscureText: loginNotifier.obscureText,
                        hintText: "Password",
                        validator: (password) {
                          if (password!.isEmpty || password.length < 8) {
                            return "Ẹnter a valid pass";
                          } else {
                            return null;
                          }
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            loginNotifier.obscureText =
                                !loginNotifier.obscureText;
                          },
                          child: Icon(
                            loginNotifier.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(kDark.value),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          24.0), // Adjust the value as desired
                      child: CustomTextField(
                        controller: password2,
                        keyboardType: TextInputType.text,
                        obscureText: loginNotifier.obscureText,
                        hintText: "Password 2",
                        validator: (password2) {
                          if (password2!.isEmpty || password2.length < 8) {
                            return "Ẹnter a valid pass";
                          } else {
                            return null;
                          }
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            loginNotifier.obscureText =
                                !loginNotifier.obscureText;
                          },
                          child: Icon(
                            loginNotifier.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(kDark.value),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15, // most screen fit this LOL
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      clipBehavior: Clip.antiAlias,
                      child: CustomButton1(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                          // Get.to(
                          //   () => const MainScreen(),

                          // );
                          // if (loginNotifier.validateAndSave()) {

                          // } else {
                          //   Get.snackbar(
                          //       "Sign failed", "Please check your credentials",
                          //       colorText: Color(kLight.value),
                          //       backgroundColor: Colors.red,
                          //       icon: Icon(Icons.add_alert));
                          // }
                          // LoginModel model =
                          //     LoginModel(email: email.text, password: password.text);
                          // loginNotifier.userLogin(model);
                        },
                        text: "REGISTER",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // forgot password field
          ],
        );
      },
    );
  }
}
