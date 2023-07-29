import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaithuhay_clone/app_style.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';
import 'package:vaithuhay_clone/reusable_text.dart';
import 'package:vaithuhay_clone/reusable_text_for_long_text.dart';

import 'Models/product_helper.dart';
import 'Models/responses/cart_by_userid_model.dart';
import 'custom_appbar_login_register.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  GetCartByUserIdModel? items;
  var isLoaded = false;
  getData() async {
    items = await (GetAllService().getCart());
    print(items);
    print(items?.data[0].cartItems[0].quantity);
    print(items?.data[0]);
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
                      height: 500,
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
                                              // Ink.image(
                                              //   image: AssetImage(
                                              //       'assets/images/23e.PNG'),
                                              //   width: 50,
                                              //   height: 120,
                                              // ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 24,
                                          ),
                                          Container(
                                            width: 200,
                                            child: ReusableTextForLongText(
                                                text:
                                                    "${items?.data[index].cartItems[0].product.name}",
                                                style: appstyle(
                                                    26,
                                                    Color(kOrange.value),
                                                    FontWeight.w400)),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons
                                                .accessible_forward_rounded),
                                            iconSize: 40,
                                          )
                                        ],
                                      ),
                                      ReusableTextForLongText(
                                          text:
                                              "Số lượng:${items?.data[index].cartItems[0].quantity}",
                                          style: appstyle(22, Colors.blueAccent,
                                              FontWeight.w400)),
                                      // ReusableTextForLongText(
                                      //     text:
                                      //         "Tổng:${items?.data[index].cartItems[0].total}",
                                      //     style: appstyle(
                                      //         28, Colors.grey, FontWeight.w400)),
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
