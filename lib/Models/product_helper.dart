import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaithuhay_clone/Models/all_product_models.dart';
import 'package:vaithuhay_clone/Models/requests/authens/add_to_cart_model.dart';
import 'package:vaithuhay_clone/Models/responses/cart_by_userid_model.dart';
import 'package:vaithuhay_clone/Models/responses/get_wishlist_model.dart';
import 'package:vaithuhay_clone/Models/responses/order_by_userid_model.dart';

class GetAllService {
  Future<AllProductsModel> getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("accessToken");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var Client = http.Client();

    var uri =
        Uri.parse("http://18.143.102.131:44391/api/product/getAll?PageSize=49");
    var response = await Client.get(uri, headers: requestHeaders);
    if (response.statusCode == 200) {
      var json = response.body;
      return allProductsModelFromJson(json);
    } else {
      throw Exception('Failed to load ');
    }
  }

  Future<GetCartByUserIdModel> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("accessToken");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var Client = http.Client();

    var uri = Uri.parse("http://18.143.102.131:44391/api/cart/getByUserId");
    var response = await Client.get(uri, headers: requestHeaders);
    if (response.statusCode == 200) {
      var json = response.body;
      return getCartByUserIdModelFromJson(json);
    } else {
      throw Exception('Failed to load ');
    }
  }

  Future<GetWishListModel> getWishList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("accessToken");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var Client = http.Client();

    var uri = Uri.parse("http://18.143.102.131:44391/api/wishlist/getByUserId");
    var response = await Client.get(uri, headers: requestHeaders);
    if (response.statusCode == 200) {
      var json = response.body;
      return getWishListModelFromJson(json);
    } else {
      throw Exception('Failed to load ');
    }
  }

  Future<GetOrderByUserIdModel> getOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("accessToken");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var Client = http.Client();

    var uri = Uri.parse(
        "http://18.143.102.131:44391/api/order/getByUserId?PageSize=40");
    var response = await Client.get(uri, headers: requestHeaders);
    if (response.statusCode == 200) {
      var json = response.body;
      return getOrderByUserIdModelFromJson(json);
    } else {
      throw Exception('Failed to load ');
    }
  }
}
