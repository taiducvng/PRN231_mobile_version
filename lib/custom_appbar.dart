import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:vaithuhay_clone/constants/app_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 60, 0),
          child: Ink.image(
            image: const AssetImage("assets/images/logo_medium.png"),
            height: 0,
            width: 110,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.favorite_outlined),
          onPressed: () {
            // Add your search functionality here
          },
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: Icon(Icons.shopping_cart_outlined),
        )
      ],
    );
  }
}
