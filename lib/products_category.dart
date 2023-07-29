import 'package:flutter/material.dart';
import 'package:vaithuhay_clone/all_product.dart';

import 'home_screen.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width,
          color: const Color(0xff535353),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top item
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Stack(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16.0), // Adjust the value as desired
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 12, 8, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.pest_control_rodent_sharp),
                                        SizedBox(height: 8),
                                        ElevatedButton(
                                          onPressed: () {
                                            Future.delayed(Duration(seconds: 0),
                                                () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AllProductScreen()),
                                              );
                                            });
                                          },
                                          child: Text(
                                            'Tất cả sản phẩm',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.amber),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .transparent, // Set the button background color to transparent
                                            elevation:
                                                0, // Remove the button shadow
                                            padding: EdgeInsets
                                                .zero, // Remove default button padding
                                            // Reduce the button's tap target size
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text('Left Text'),
                                        //     Text('Right Text'),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Stack(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16.0), // Adjust the value as desired
                              ),
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 12, 8, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.pest_control_rodent_sharp),
                                        SizedBox(height: 8),
                                        Text(
                                          'Loa/Tai nghe hay hay',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.amber),
                                        ),
                                        SizedBox(height: 16),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text('Left Text'),
                                        //     Text('Right Text'),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Stack(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16.0), // Adjust the value as desired
                              ),
                              elevation: 4,
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.pest_control_rodent_sharp),
                                        SizedBox(height: 8),
                                        Text(
                                          'Phụ kiện máy tính',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.amber),
                                        ),
                                        SizedBox(height: 16),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text('Left Text'),
                                        //     Text('Right Text'),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Stack(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16.0), // Adjust the value as desired
                              ),
                              elevation: 4,
                              child: const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.pest_control_rodent_sharp),
                                        SizedBox(height: 8),
                                        Text(
                                          'Phụ kiện điện thoại',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.amber),
                                        ),
                                        SizedBox(height: 16),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text('Left Text'),
                                        //     Text('Right Text'),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  16.0), // Adjust the value as desired
                            ),
                            elevation: 4,
                            child: const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.pest_control_rodent_sharp),
                                      SizedBox(height: 8),
                                      Text(
                                        'Đồng hồ trang trí',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.amber),
                                      ),
                                      SizedBox(height: 16),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Text('Left Text'),
                                      //     Text('Right Text'),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  16.0), // Adjust the value as desired
                            ),
                            elevation: 4,
                            child: const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.pest_control_rodent_sharp),
                                      SizedBox(height: 8),
                                      Text(
                                        'Đèn công nghệ',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.amber),
                                      ),
                                      SizedBox(height: 16),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Text('Left Text'),
                                      //     Text('Right Text'),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //end of bottom items
              ],
            ),
          ),
        ),
      ],
    );
  }
}
