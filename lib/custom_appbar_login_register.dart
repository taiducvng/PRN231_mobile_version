import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:vaithuhay_clone/app_style.dart';
import 'package:vaithuhay_clone/cart_screen.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';
import 'package:vaithuhay_clone/home_screen.dart';
import 'package:vaithuhay_clone/order_screen_user.dart';
import 'package:vaithuhay_clone/reusable_text.dart';
import 'package:vaithuhay_clone/wishlist_screen.dart';

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar1({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Scaffold(
        body: AppBar(
          automaticallyImplyLeading: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 0, 30, 0),
              child: Ink.image(
                image: const AssetImage("assets/images/logo_medium.png"),
                height: 0,
                width: 110,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite_outlined),
              onPressed: () {
                Get.to(WishListWidget());
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .transparent, // Set the button background color to transparent
                  elevation: 0, // Remove the button shadow
                  padding: EdgeInsets.zero, // Remove default button padding
                  // Reduce the button's tap target size
                ),
                onPressed: () {
                  Get.to(CartWidget());
                },
                child: badges.Badge(
                  badgeContent: Text('9+'),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ),
            )
          ],
        ),
        drawer: Drawer(
          // Add the drawer property to the Scaffold
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text('Không có gì hay:\nỨng dụng mua hàng đặt trước'),
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Xem tất cả đơn hàng đã thanh toán",
                      style: appstyle(14, Colors.deepOrange, FontWeight.w400),
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(OrderScreenWidget());
                },
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Xem mục mặt hàng mơ ước",
                      style: appstyle(18, Colors.deepOrange, FontWeight.w400),
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(WishListWidget());
                },
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Về màn hình chính",
                      style: appstyle(18, Colors.deepOrange, FontWeight.w400),
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(HomeScreen());
                },
              ),
              // Add more ListTile widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
