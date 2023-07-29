import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/custom_appbar.dart';
import 'package:vaithuhay_clone/login_screen_body.dart';

import 'about_us.dart';
import 'custom_appbar_login_register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //  backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(child: CustomAppBar()),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LoginContent(),
                    AboutUsWidget(),
                  ],
                ), // what if we add column to this
              ),
            ),
          ],
        ),
      ),
    );
  }
}
