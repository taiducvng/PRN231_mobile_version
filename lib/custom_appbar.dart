import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.menu_rounded),
        ],
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink.image(
              image: AssetImage("assets/images/logo_medium.png"),
              height: 0,
              width: 190,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Add your search functionality here
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            // Add your notification functionality here
          },
        ),
      ],
    );
  }
}
