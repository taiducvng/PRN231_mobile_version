import 'package:flutter/material.dart';

class ReusableTextForDescriptions extends StatelessWidget {
  const ReusableTextForDescriptions(
      {super.key, required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 15,
      softWrap: true,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
