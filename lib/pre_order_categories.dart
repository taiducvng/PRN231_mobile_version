import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/app_style.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';
import 'package:vaithuhay_clone/reusable_text.dart';

class PreOrderScreen extends StatefulWidget {
  const PreOrderScreen({super.key});

  @override
  State<PreOrderScreen> createState() => _PreOrderScreenState();
}

class _PreOrderScreenState extends State<PreOrderScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            color: const Color(0xffFCDB4F),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              //content 1
                              Stack(
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(28.0),
                                        child: Container(
                                          height: 364,
                                          width: 284,
                                          child: Card(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 2, 0, 0),
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(24)),
                                            ),
                                            child: Stack(
                                              children: [
                                                Ink.image(
                                                  image: AssetImage(
                                                      "assets/images/9spacee.jpg"),
                                                  height: 210,
                                                  width: 324,
                                                  fit: BoxFit.cover,
                                                ),
                                                Positioned(
                                                  left: 12,
                                                  bottom: 84,
                                                  child: Container(
                                                    width: 240,
                                                    child: ReusableText(
                                                      text: "Testing text",
                                                      style: appstyle(
                                                          21,
                                                          Color(kDark.value),
                                                          FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 12,
                                                  bottom: 64,
                                                  child: ReusableText(
                                                    text: "Desscription...",
                                                    style: appstyle(
                                                        21,
                                                        Color(kDark.value),
                                                        FontWeight.w400),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: (20 / 1080) * height,
                                                  top: (455 / 1080) * height,
                                                  child: ReusableText(
                                                    text: "Detailss...",
                                                    style: appstyle(
                                                        14,
                                                        Color(kDark.value),
                                                        FontWeight.w300),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    left: 284,
                                    top: 20,
                                    child: Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      child: ClipOval(
                                        child: Center(
                                          child: ReusableText(
                                            text: "Pre Order",
                                            style: appstyle(
                                                10,
                                                Color(kLight.value),
                                                FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        
                            ],
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
