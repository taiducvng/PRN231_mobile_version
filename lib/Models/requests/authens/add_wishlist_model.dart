import 'dart:convert';

AddToWishList addToWishListFromJson(String str) =>
    AddToWishList.fromJson(json.decode(str));

String addToWishListToJson(AddToWishList data) => json.encode(data.toJson());

class AddToWishList {
  final int productId;

  AddToWishList({
    required this.productId,
  });

  factory AddToWishList.fromJson(Map<String, dynamic> json) => AddToWishList(
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
      };
}
