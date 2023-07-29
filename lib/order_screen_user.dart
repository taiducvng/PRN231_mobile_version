import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaithuhay_clone/app_style.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';
import 'package:vaithuhay_clone/reusable_text.dart';
import 'package:vaithuhay_clone/reusable_text_for_long_text.dart';

import 'Models/product_helper.dart';
import 'Models/responses/cart_by_userid_model.dart';
import 'Models/responses/order_by_userid_model.dart';
import 'custom_appbar_login_register.dart';

class OrderScreenWidget extends StatefulWidget {
  const OrderScreenWidget({super.key});

  @override
  State<OrderScreenWidget> createState() => _OrderScreenWidgetState();
}

class _OrderScreenWidgetState extends State<OrderScreenWidget> {
  GetOrderByUserIdModel? items;
  var isLoaded = false;
  getData() async {
    items = await (GetAllService().getOrder());
    print(items);
    print(items?.data.length);
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
                      height: hieght,
                      child: ListView.builder(
                        itemCount: (items?.data.length),
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
                                                    'https://cdn0.iconfinder.com/data/icons/positive-character-traits-alphabet-p/233/positive-p004-512.png'),
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
                                                    "${items?.data[index].orderDetails[0].productName}",
                                                style: appstyle(
                                                    16,
                                                    Color(kOrange.value),
                                                    FontWeight.w400)),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 250,
                                        child: ReusableTextForLongText(
                                            text:
                                                "Cách thức thanh toán:${items?.data[index].paymentType.paymentMethod.name}",
                                            style: appstyle(
                                                26,
                                                Color(kOrange.value),
                                                FontWeight.w400)),
                                      ),
                                      ReusableTextForLongText(
                                          text:
                                              "Số lượng:${items?.data[index].orderDetails[0].quantity}",
                                          style: appstyle(22, Colors.blueAccent,
                                              FontWeight.w400)),
                                      Container(
                                        width: 280,
                                        child: ReusableTextForLongText(
                                            text:
                                                "Tổng trước khi tính các phụ phí:${items?.data[index].totalAmount}",
                                            style: appstyle(
                                                26,
                                                Color(kOrange.value),
                                                FontWeight.w400)),
                                      ),
                                      Container(
                                        width: 200,
                                        child: ReusableTextForLongText(
                                            text:
                                                "Phụ phí:\n${items?.data[index].shippingFee}",
                                            style: appstyle(
                                                26,
                                                Color(kOrange.value),
                                                FontWeight.w400)),
                                      ),
                                      Container(
                                        width: 200,
                                        child: ReusableTextForLongText(
                                            text:
                                                "Tổng cuối cùng:\n${items?.data[index].finalAmount}",
                                            style: appstyle(
                                                26,
                                                Color(kOrange.value),
                                                FontWeight.w400)),
                                      ),
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
