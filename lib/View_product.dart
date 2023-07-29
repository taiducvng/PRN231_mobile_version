import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaithuhay_clone/Models/requests/authens/add_to_cart_helper.dart';
import 'package:vaithuhay_clone/Models/requests/authens/add_to_cart_model.dart';
import 'package:vaithuhay_clone/Models/requests/authens/add_wishlist_model.dart';
import 'package:vaithuhay_clone/about_us.dart';
import 'package:vaithuhay_clone/app_style.dart';
import 'package:vaithuhay_clone/constants/app_constants.dart';
import 'package:vaithuhay_clone/controller_getx/cart_controller.dart';
import 'package:vaithuhay_clone/custom_appbar_login_register.dart';
import 'package:vaithuhay_clone/login_provider.dart';
import 'package:vaithuhay_clone/reusable_text.dart';
import 'package:vaithuhay_clone/reusable_text_for_descriptions.dart';
import 'package:vaithuhay_clone/reusable_text_for_long_text.dart';

import 'Models/requests/authens/add_wishlist_helper.dart';
import 'controller_getx/dropdown_controller.dart';
import 'custom_appbar.dart';

class ViewProductScreen extends StatefulWidget {
  static const String routeName = '/view_product_Screen';
  ViewProductScreen(
      {super.key,
      this.imgUrl,
      this.name,
      this.description,
      this.price,
      this.ProductId});
  final String? imgUrl;
  final String? name;
  final String? description;
  final double? price;
  final int? ProductId;
  static const List<int> listItems = <int>[1, 2];
  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("accessToken");
      print(token);
      super.initState();
    });
  }

  String dropdownValueForLocation = '1';
  int _counter = 1;
  final CartItemController c = Get.put(CartItemController());
  final DropdownController controller = Get.put(DropdownController());
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    //retrieve data
    final String? imgUrl = arguments?['imgUrl'];
    final String? name = arguments?['name'];
    final String? description = arguments?['description'];
    final double? price = arguments?['price'];
    final int ProductId = arguments?['productId'];
    return Scaffold(
      //  backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(child: CustomAppBar1()),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        color: Color(kDarkGrey.value),
                        child: Image.network(
                          "$imgUrl",
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                    Center(
                      child: ReusableText(
                        text: "$name",
                        style: appstyle(
                            24, Color(kLightBlue.value), FontWeight.w600),
                      ),
                    ),
                    Visibility(
                      visible: false,
                      child: Center(
                        child: ReusableText(
                          text: "$ProductId",
                          style: appstyle(
                              24, Color(kLightBlue.value), FontWeight.w600),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        child: ReusableTextForDescriptions(
                          text: "$description",
                          style: appstyle(
                              16, Color(kDarkGrey.value), FontWeight.w600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ReusableText(
                        text: "$price /1 cái",
                        style: appstyle(24, Color(kRed.value), FontWeight.w600),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            color: Colors.red,
                          ),
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.red,
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .transparent, // Set the button background color to transparent
                                elevation: 0, // Remove the button shadow
                                padding: EdgeInsets
                                    .zero, // Remove default button padding
                                // Reduce the button's tap target size
                              ),
                              onPressed: () {
                                AddToWishList model1 =
                                    AddToWishList(productId: ProductId);
                                AddWishListService.addWishList(model1);
                              },
                              child: ReusableText(
                                text: "Add to wishlist ",
                                style: appstyle(16, Color(kLightBlue.value),
                                    FontWeight.w600),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .transparent, // Set the button background color to transparent
                                elevation: 0, // Remove the button shadow
                                padding: EdgeInsets
                                    .zero, // Remove default button padding
                                // Reduce the button's tap target size
                              ),
                              onPressed: () {
                                Future.delayed(Duration(seconds: 1), () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: 300,
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 200,
                                                child:
                                                    ReusableTextForDescriptions(
                                                        text: "$name",
                                                        style: appstyle(
                                                            18,
                                                            Colors.orange,
                                                            FontWeight.w400)),
                                              ),
                                              Row(children: [
                                                IconButton(
                                                  onPressed: () {
                                                    c.decrement();
                                                  },
                                                  icon: Icon(
                                                    Icons.remove_circle,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                Obx(
                                                  () => ReusableText(
                                                      text: "${c.items.obs}",
                                                      style: appstyle(
                                                          12,
                                                          Color(
                                                              kLightBlue.value),
                                                          FontWeight.w400)),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    c.increment();
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ReusableText(
                                                  text: "Chọn khuyến mãi",
                                                  style: appstyle(
                                                      16,
                                                      Color(kLightBlue.value),
                                                      FontWeight.w300)),
                                              Obx(() => DropdownButton<String>(
                                                    value: controller
                                                        .selectedValue.value,
                                                    icon:
                                                        const Icon(Icons.menu),
                                                    items: const [
                                                      DropdownMenuItem<String>(
                                                          value: '1',
                                                          child: Text(
                                                            "Giảm giá 50%",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .amber),
                                                          )),
                                                      DropdownMenuItem<String>(
                                                          value: '2',
                                                          child: Text(
                                                            "Tích 1 điểm cho đơn",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .amber),
                                                          )),
                                                    ],
                                                    onChanged:
                                                        (String? newValue) {
                                                      print(newValue);
                                                      print(c
                                                          .items); // Add the print statement here to see the selected value
                                                      print(controller
                                                          .selectedValue(
                                                              newValue));
                                                      print(controller
                                                          .selectedValue());
                                                    },
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ReusableText(
                                                  text: "Total :",
                                                  style: appstyle(
                                                      24,
                                                      Color(kLightBlue.value),
                                                      FontWeight.w400)),
                                              Center(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // Convert selectedValue to a numeric type (e.g., int or double)
                                                    double selectedValue =
                                                        double.parse(controller
                                                            .selectedValue
                                                            .value);

                                                    // Get the value of c.items as an int (assuming it's an int)
                                                    int itemCount =
                                                        c.items.value;

                                                    // Perform the multiplication
                                                    double total =
                                                        price! * itemCount;
                                                    print('Total: $total');
                                                    List<CartItem> cartItems = [
                                                      CartItem(
                                                        productId: ProductId,
                                                        quantity:
                                                            itemCount, // Replace with the appropriate quantity
                                                        total: total
                                                            .toInt(), // Replace with the appropriate total
                                                      ),
                                                    ];
                                                    AddToCartModel model =
                                                        AddToCartModel(
                                                      promotionId:
                                                          selectedValue.toInt(),
                                                      total: total.toInt(),
                                                      amount: itemCount,
                                                      cartItems: cartItems,
                                                    );
                                                    AddToCartService.addToCart(
                                                        model);
                                                  },
                                                  child: ReusableText(
                                                    text: "Add now to cart",
                                                    style: appstyle(
                                                        20,
                                                        Color(
                                                            kLightPurple.value),
                                                        FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      );
                                    },
                                  );
                                });
                              },
                              child: ReusableText(
                                text: "Add to cart ",
                                style: appstyle(16, Color(kLightBlue.value),
                                    FontWeight.w600),
                              ),
                            ),
                          ]),
                    ),
                    const AboutUsWidget(),
                  ],
                ), // what if we add column to this
              ),
            ),
          ],
        ),
      ),
    );
  }
}
