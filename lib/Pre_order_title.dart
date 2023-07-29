import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/reusable_text.dart';

import 'app_style.dart';
import 'constants/app_constants.dart';

class POrderTitleScreen extends StatelessWidget {
  const POrderTitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      color: const Color(0xffFCDB4F),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(36, 32, 16, 12),
        child: ReusableText(
          text: "CHIẾN DỊCH PRE - ORDER",
          style: appstyle(20, Color(kLightBlue.value), FontWeight.w400),
        ),
      ),
    );
  }
}
