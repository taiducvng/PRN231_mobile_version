import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/app_style.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';
import 'package:vaithuhay_clone/reusable_text.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({super.key});

  @override
  State<AboutUsWidget> createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  bool isVisible = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xff262626),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Column(
              children: [
                // Visibility when click on the dropdown
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .transparent, // Set the button background color to transparent
                    elevation: 0, // Remove the button shadow
                    padding: EdgeInsets.zero, // Remove default button padding
                    // Reduce the button's tap target size
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                        text: "VỀ CHÚNG TÔI",
                        style:
                            appstyle(24, Color(kLight.value), FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Icon(Icons.arrow_drop_down_outlined),
                      ),
                    ],
                  ),
                ),
                if (isVisible == true)
                  Visibility(
                    visible: true,
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: ReusableText(
                              text: "Chúng tôi là ai",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ReusableText(
                              text: "Tuyển dụng",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ReusableText(
                              text: "Tuyển dụng",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ReusableText(
                              text: "Tuyển dụng",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                // VISIBILITY 2
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isVisible2 = !isVisible2;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .transparent, // Set the button background color to transparent
                    elevation: 0, // Remove the button shadow
                    padding: EdgeInsets.zero, // Remove default button padding
                    // Reduce the button's tap target size
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                        text: "CÁC CHÍNH SÁCH",
                        style:
                            appstyle(24, Color(kLight.value), FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Icon(Icons.arrow_drop_down_outlined),
                      ),
                    ],
                  ),
                ),
                if (isVisible2 == true)
                  Visibility(
                    visible: true,
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: ReusableText(
                              text: "Chúng tôi là ai",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ReusableText(
                              text: "Tuyển dụng",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ReusableText(
                              text: "Tuyển dụng",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ReusableText(
                              text: "Tuyển dụng",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isVisible3 = !isVisible3;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .transparent, // Set the button background color to transparent
                    elevation: 0, // Remove the button shadow
                    padding: EdgeInsets.zero, // Remove default button padding
                    // Reduce the button's tap target size
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                        text: "DANH MỤC SẢN PHẨM",
                        style:
                            appstyle(24, Color(kLight.value), FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Icon(Icons.arrow_drop_down_outlined),
                      ),
                    ],
                  ),
                ),
                if (isVisible3 == true)
                  Visibility(
                    visible: true,
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: ReusableText(
                              text: "Chúng tôi là ai",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ReusableText(
                              text: "Tuyển dụng",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ReusableText(
                              text: "Tuyển dụng",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ReusableText(
                              text: "Tuyển dụng",
                              style: appstyle(
                                  20, Color(kLight.value), FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                FractionallySizedBox(
                  widthFactor: 1.18,
                  child: Image.asset(
                    "assets/images/aboutus_ovalhehe2.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
