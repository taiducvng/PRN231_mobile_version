import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) =>
    AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  final int promotionId;  
  final int total;
  final int amount;
  final List<CartItem> cartItems;

  AddToCartModel({
    required this.promotionId,
    required this.total,
    required this.amount,
    required this.cartItems,
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        promotionId: json["promotionId"],
        total: json["total"],
        amount: json["amount"],
        cartItems: List<CartItem>.from(
            json["cartItems"].map((x) => CartItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "promotionId": promotionId,
        "total": total,
        "amount": amount,
        "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
      };
}

class CartItem {
  final int productId;
  final int quantity;
  final int total;

  CartItem({
    required this.productId,
    required this.quantity,
    required this.total,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productId: json["productId"],
        quantity: json["quantity"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "total": total,
      };
}
