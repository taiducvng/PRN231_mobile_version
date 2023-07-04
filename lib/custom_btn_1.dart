import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/reusable_text.dart';

import 'app_style.dart';
import 'constants/app_constants.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({super.key, required this.text, this.color, this.onTap});
  final String text;
  final Color? color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //   color: Colors.transparent,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
            color: Colors.black,
            width: 2.0, // Increase the border width for a bolder outline
          ),
        ),
        width: width,
        height: hieght! * 0.065,
        child: Center(
          child: ReusableText(
              text: text,
              style: appstyle(16, Color(kDark.value), FontWeight.w600)),
        ),
      ),
    );
  }
}
