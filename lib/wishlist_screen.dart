import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaithuhay_clone/app_style.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';
import 'package:vaithuhay_clone/reusable_text.dart';
import 'package:vaithuhay_clone/reusable_text_for_long_text.dart';

import 'Models/product_helper.dart';
import 'Models/responses/cart_by_userid_model.dart';
import 'Models/responses/get_wishlist_model.dart';
import 'custom_appbar_login_register.dart';

class WishListWidget extends StatefulWidget {
  const WishListWidget({super.key});

  @override
  State<WishListWidget> createState() => _WishListWidgetState();
}

class _WishListWidgetState extends State<WishListWidget> {
  GetWishListModel? items;
  var isLoaded = false;
  getData() async {
    items = await (GetAllService().getWishList());
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
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomAppBar1(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: 500,
                      height: 600,
                      child: ListView.builder(
                        itemCount: items?.data.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(36),
                            child: Card(
                              color: Color(kLightGrey.value),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            // alignment: Alignment.topLeft,
                                            children: [
                                              Ink.image(
                                                image: NetworkImage(
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Heart_coraz%C3%B3n.svg/800px-Heart_coraz%C3%B3n.svg.png'),
                                                width: 50,
                                                height: 120,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 24,
                                          ),
                                          Container(
                                            width: 200,
                                            child: ReusableTextForLongText(
                                                text:
                                                    "${items?.data[index].product.name}",
                                                style: appstyle(
                                                    26,
                                                    Color(kOrange.value),
                                                    FontWeight.w400)),
                                          ),
                                          // IconButton(
                                          //   onPressed: () {},
                                          //   icon: Icon(Icons
                                          //       .accessible_forward_rounded),
                                          //   iconSize: 40,
                                          // )
                                        ],
                                      ),
                                      ReusableTextForLongText(
                                          text:
                                              "${items?.data[index].product.description}",
                                          style: appstyle(
                                              26,
                                              Color(kOrange.value),
                                              FontWeight.w400)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ), // what if we add column to this
            ),
          ],
        ),
      ),
    );
  }
}
