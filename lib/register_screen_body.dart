import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vaithuhay_clone/app_style.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';
import 'package:vaithuhay_clone/constants/custom_textfield.dart';
import 'package:vaithuhay_clone/custom_btn_1.dart';
import 'package:vaithuhay_clone/login_provider.dart';
import 'package:vaithuhay_clone/register_screen.dart';
import 'package:vaithuhay_clone/reusable_text.dart';

import 'Models/requests/authens/signup_model.dart';

class RegisterContent extends StatefulWidget {
  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();

//fix from here we didnt finish yet
  File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      _image = imageTemp;
    });
    print(image.path);
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    password2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(
                          24.0), // Adjust the value as desired
                      child: CustomTextField(
                        controller: name,
                        keyboardType: TextInputType.text,
                        hintText: "  Full name",
                        validator: (email) {
                          return null;

                          // if (email!.isEmpty || !email.contains("@")) {
                          //   return "Enter a valid email";
                          // } else {
                          //   return null;
                          // }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(
                          24.0), // Adjust the value as desired
                      child: CustomTextField(
                        controller: phone,
                        keyboardType: TextInputType.number,
                        hintText: "  Phone number",
                        validator: (email) {
                          return null;

                          // if (email!.isEmpty || !email.contains("@")) {
                          //   return "Enter a valid email";
                          // } else {
                          //   return null;
                          // }
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
                  // all field up now we do the picture
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheetDirect()),
                          );
                        },
                        child: Column(children: [
                          _image != null
                              ? Image.file(
                                  _image!,
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.cover,
                                )
                              : FlutterLogo(
                                  size: 160,
                                ),
                        ]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15, // most screen fit this LOL
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      clipBehavior: Clip.antiAlias,
                      child: CustomButton1(
                        onTap: () {
                          SignupModel model = SignupModel(
                              name: name.text,
                              email: email.text,
                              password: password.text,
                              phone: phone.text);
                          loginNotifier.userSignup(model);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const RegisterScreen()),
                          // );
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

  Widget bottomSheetDirect() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          ReusableText(
            text: "Choose profile photo",
            style: appstyle(20, Color(kLightBlue.value), FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  //     takePhoto(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
                label: const Text("Camera"),
              ),
              TextButton.icon(
                onPressed: () {
                  getImage();
                },
                icon: const Icon(Icons.image),
                label: const Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
