import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/custom_appbar.dart';
import 'package:vaithuhay_clone/login_screen_body.dart';

import 'about_us.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //  backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
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
