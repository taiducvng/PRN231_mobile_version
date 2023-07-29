import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaithuhay_clone/View_product.dart';
import 'package:vaithuhay_clone/reusable_text.dart';
import 'package:vaithuhay_clone/reusable_text_for_long_text.dart';

import 'Models/all_product_models.dart';
import 'Models/product_helper.dart';
import 'app_style.dart';
import 'constants/app_constants.dart';

class AllProductPagingScreen extends StatefulWidget {
  const AllProductPagingScreen({super.key});

  @override
  State<AllProductPagingScreen> createState() => _AllProductPagingScreenState();
}

class _AllProductPagingScreenState extends State<AllProductPagingScreen> {
  late AllProductsModel items;
  var isLoaded = false;
  getData() async {
    items = await (GetAllService().getAll());
    print(items);
    WidgetsFlutterBinding.ensureInitialized();
    if (items != null) {
      setState(() {
        isLoaded = true;
      });
    } else {
      Future.delayed(
        Duration(seconds: 0),
      );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("accessToken");
      print(token);
    });

    //fetch data from API
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Container(
            height: 500,
            width: 800,
            // change width to fit the screen instead
            color: const Color(0xffFCDB4F),
            child: ListView.builder(
              itemCount: (items!.data.length ~/ 2),
              itemBuilder: ((context, index) {
                int Indexa = (index) * 2;
                int Indexb = (index) * 2 + 1;

                return Column(
                  children: [
                    Row(
                      // each row has 2 contents
                      children: [
                        //content 1
                        Stack(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 374,
                                    width: 184,
                                    child: Card(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      clipBehavior: Clip.antiAlias,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                      child: Stack(
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors
                                                  .transparent, // Set the button background color to transparent
                                              elevation:
                                                  0, // Remove the button shadow
                                              padding: EdgeInsets
                                                  .zero, // Remove default button padding
                                              // Reduce the button's tap target size
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                ViewProductScreen.routeName,
                                                arguments: {
                                                  'imgUrl': items?.data[Indexa]
                                                      .productDetails[0].imgUrl,
                                                  'name':
                                                      items?.data[Indexa].name,
                                                  'description': items
                                                      ?.data[Indexa]
                                                      .description,
                                                  'price':
                                                      items?.data[Indexa].price,
                                                  'productId':
                                                      items?.data[Indexa].id,
                                                },
                                              );
                                            },
                                            child: Ink.image(
                                              image: NetworkImage(
                                                  "${items?.data[Indexa].productDetails[0].imgUrl}"),
                                              height: 110,
                                              width: 324,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            left: 12,
                                            top: 124,
                                            child: Container(
                                              width: 140,
                                              child: ReusableText(
                                                text:
                                                    "${items?.data[Indexa].name} ",
                                                style: appstyle(
                                                    18,
                                                    Color(kDark.value),
                                                    FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 1,
                                            top: 194,
                                            child: Container(
                                              width: 180,
                                              child: ReusableTextForLongText(
                                                text:
                                                    "${items?.data[Indexa].description}",
                                                style: appstyle(
                                                    16,
                                                    Color(kDark.value),
                                                    FontWeight.w300),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 30,
                                            bottom: 32,
                                            child: Container(
                                              width: 180,
                                              child: ReusableTextForLongText(
                                                text:
                                                    "${items?.data[Indexa].price}",
                                                style: appstyle(
                                                    16,
                                                    Color(kDark.value),
                                                    FontWeight.w300),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: (180 / 1080) * height,
                                            top: (425 / 1080) * height,
                                            child: const Icon(
                                              Icons.shopping_cart_outlined,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Positioned(
                            //   left: 154,
                            //   top: 0,
                            //   child: Container(
                            //     width: 48,
                            //     height: 48,
                            //     decoration: const BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Colors.red,
                            //     ),
                            //     child: ClipOval(
                            //       child: Center(
                            //         child: ReusableText(
                            //           text: "Pre Order",
                            //           style: appstyle(10, Color(kLight.value),
                            //               FontWeight.w400),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        //content 2
                        Stack(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 364,
                                    width: 184,
                                    child: Card(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      clipBehavior: Clip.antiAlias,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                      child: Stack(
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors
                                                  .transparent, // Set the button background color to transparent
                                              elevation:
                                                  0, // Remove the button shadow
                                              padding: EdgeInsets
                                                  .zero, // Remove default button padding
                                              // Reduce the button's tap target size
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                ViewProductScreen.routeName,
                                                arguments: {
                                                  'imgUrl': items?.data[Indexb]
                                                      .productDetails[0].imgUrl,
                                                  'name':
                                                      items?.data[Indexb].name,
                                                  'description': items
                                                      ?.data[Indexb]
                                                      .description,
                                                  'price':
                                                      items?.data[Indexb].price,
                                                  'productId':
                                                      items?.data[Indexb].id,
                                                },
                                              );
                                            },
                                            child: Ink.image(
                                              image: NetworkImage(
                                                  "${items?.data[Indexb].productDetails[0].imgUrl}"),
                                              height: 110,
                                              width: 324,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            left: 12,
                                            top: 124,
                                            child: Container(
                                              width: 140,
                                              child: ReusableText(
                                                text:
                                                    "${items?.data[Indexb].name}",
                                                style: appstyle(
                                                    18,
                                                    Color(kDark.value),
                                                    FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 1,
                                            top: 194,
                                            child: Container(
                                              width: 180,
                                              child: ReusableTextForLongText(
                                                text:
                                                    "${items?.data[Indexb].description}",
                                                style: appstyle(
                                                    16,
                                                    Color(kDark.value),
                                                    FontWeight.w300),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 30,
                                            bottom: 32,
                                            child: Container(
                                              width: 180,
                                              child: ReusableTextForLongText(
                                                text:
                                                    "${items?.data[Indexb].price}",
                                                style: appstyle(
                                                    16,
                                                    Color(kDark.value),
                                                    FontWeight.w300),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: (180 / 1080) * height,
                                            top: (425 / 1080) * height,
                                            child: const Icon(
                                              Icons.shopping_cart_outlined,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Positioned(
                            //   left: 154,
                            //   top: 0,
                            //   child: Container(
                            //     width: 48,
                            //     height: 48,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Colors.red,
                            //     ),
                            //     child: ClipOval(
                            //       child: Center(
                            //         child: ReusableText(
                            //           text: "Pre Order",
                            //           style: appstyle(
                            //               10, Color(kLight.value), FontWeight.w400),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    //
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
