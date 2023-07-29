import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaithuhay_clone/Models/all_product_models.dart';
import 'package:vaithuhay_clone/Models/product_helper.dart';
import 'package:vaithuhay_clone/custom_appbar_login_register.dart';
import 'package:vaithuhay_clone/pre_order_categories.dart';
import 'package:vaithuhay_clone/products_category.dart';
import 'package:vaithuhay_clone/reusable_text.dart';
import 'package:vaithuhay_clone/reusable_text_for_descriptions.dart';
import 'package:vaithuhay_clone/reusable_text_for_long_text.dart';

import 'Pre_order_title.dart';
import 'about_us.dart';
import 'app_style.dart';
import 'constants/app_constants.dart';
import 'custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AllProductsModel? items;
  var isLoaded = false;
  final urlImages = [
    'assets/images/295053674_557383019398454_3585867586572656328_n.jpg',
    'assets/images/292281625_416124373877981_4719750468545616290_n.png'
  ];
  @override
  void initState() {
    //fetch data from API
    getData();
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("accessToken");
      print(token);
    });
  }

  getData() async {
    try {
      items = (await (GetAllService().getAll()));
      print(items);
      print(items?.data.length);
      print(items?.data[0]);
      if (items != null) {
        setState(() {
          isLoaded = true;
        });
      }
    } catch (e) {
      return const Icon(Icons.image);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //  backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar1(),
              Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                        child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(
                              34.0), // Adjust the value as desired
                          child: Card(
                            child: CarouselSlider.builder(
                              itemCount: urlImages.length,
                              options: CarouselOptions(
                                height: 200,
                                autoPlay: true,
                                viewportFraction: 1,
                              ),
                              itemBuilder: (context, index, realIndex) {
                                final urlImage = urlImages[index];
                                return buildImage(urlImage, index);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ProductCategoryScreen(),
                  const POrderTitleScreen(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 500,
                      width: 12430,
                      child: Visibility(
                        visible: isLoaded,
                        child: Container(
                          color: Colors.amber,
                          child: ListView.builder(
                            itemCount: items?.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(28.0),
                                            child: Container(
                                              height: 464,
                                              width: 284,
                                              child: Card(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 2, 0, 0),
                                                clipBehavior: Clip.antiAlias,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(24)),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Ink.image(
                                                      image: NetworkImage(
                                                          "${items?.data[index].productDetails[0].imgUrl}"),
                                                      height: 210,
                                                      width: 324,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Positioned(
                                                      left: 12,
                                                      bottom: 164,
                                                      child: Container(
                                                        width: 240,
                                                        child: ReusableText(
                                                          text:
                                                              "${items?.data[index].name}",
                                                          style: appstyle(
                                                              21,
                                                              Color(
                                                                  kDark.value),
                                                              FontWeight.w400),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 22,
                                                      bottom: 74,
                                                      child: Container(
                                                        width: 240,
                                                        child:
                                                            ReusableTextForLongText(
                                                          text:
                                                              "${items?.data[index].description}",
                                                          style: appstyle(
                                                              16,
                                                              Color(
                                                                  kDark.value),
                                                              FontWeight.w400),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left:
                                                          (20 / 1080) * height,
                                                      bottom:
                                                          (25 / 1080) * height,
                                                      child: ReusableText(
                                                        text:
                                                            "${items?.data[index].execptedReleaseDate}",
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
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const AboutUsWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    try {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        color: Colors.grey,
        width: double.infinity,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
    } catch (e) {
      return const Icon(Icons.image);
    }
  }
}
