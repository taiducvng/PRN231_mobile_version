import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/All_product_title.dart';
import 'package:vaithuhay_clone/all_product_content_screen.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';

import 'about_us.dart';
import 'app_style.dart';
import 'custom_appbar.dart';
import 'custom_appbar_login_register.dart';
import 'reusable_text.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //  backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(child: CustomAppBar1()),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    AllProductTitle(),
                    AllProductPagingScreen(),
                    const AboutUsWidget(),
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
