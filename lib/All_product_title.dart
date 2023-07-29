import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/app_style.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';
import 'package:vaithuhay_clone/reusable_text.dart';

class AllProductTitle extends StatelessWidget {
  const AllProductTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xffF0F2F1),
          child: Card(
            child: Container(
              color: const Color(0xffFCDB4F),
              child: ReusableText(
                text: "Tất cả sản phẩm",
                style: appstyle(32, Color(kDark.value), FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
