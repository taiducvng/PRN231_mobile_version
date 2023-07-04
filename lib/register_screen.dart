import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/register_screen_body.dart';

import 'about_us.dart';
import 'custom_appbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            Column(),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RegisterContent(),
                    AboutUsWidget(),
                  ],
                ), // what if we add column to this
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: "Điện thoại",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black, // Customize the selected item color
        unselectedItemColor:
            Colors.black, // Customize the unselected item color
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        backgroundColor: Colors.transparent, // Make the background transparent
        elevation: 0, // Remove the shadow
        type: BottomNavigationBarType
            .fixed, // Ensure all items are always visible
      ),
    );
  }
}
