import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/reusable_text.dart';

import 'app_style.dart';
import 'constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.color, this.onTap});
  final String text;
  final Color? color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(KYellowaf.value),
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
