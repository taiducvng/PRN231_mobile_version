import 'dart:convert';

GetCartByUserIdModel getCartByUserIdModelFromJson(String str) =>
    GetCartByUserIdModel.fromJson(json.decode(str));

String getCartByUserIdModelToJson(GetCartByUserIdModel data) =>
    json.encode(data.toJson());

class GetCartByUserIdModel {
  final Metadata metadata;
  final List<Datum> data;
  final bool isError;
  final dynamic message;

  GetCartByUserIdModel({
    required this.metadata,
    required this.data,
    required this.isError,
    required this.message,
  });

  factory GetCartByUserIdModel.fromJson(Map<String, dynamic> json) =>
      GetCartByUserIdModel(
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        isError: json["isError"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "isError": isError,
        "message": message,
      };
}

class Datum {
  final int id;
  final Customer customer;
  final Promotion promotion;
  final String total;
  final List<CartItem> cartItems;

  Datum({
    required this.id,
    required this.customer,
    required this.promotion,
    required this.total,
    required this.cartItems,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        customer: Customer.fromJson(json["customer"]),
        promotion: Promotion.fromJson(json["promotion"]),
        total: json["total"].toString(),
        cartItems: List<CartItem>.from(
            json["cartItems"].map((x) => CartItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer": customer.toJson(),
        "promotion": promotion.toJson(),
        "total": total.toString(),
        "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
      };
}

class CartItem {
  final int id;
  final int cartId;
  final int quantity;
  final String total;
  final Product product;

  CartItem({
    required this.id,
    required this.cartId,
    required this.quantity,
    required this.total,
    required this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        cartId: json["cartId"],
        quantity: json["quantity"],
        total: json["total"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cartId": cartId,
        "quantity": quantity,
        "total": total,
        "product": product.toJson(),
      };
}

class Product {
  final int id;
  final String productCode;
  final String name;
  final String price;

  Product({
    required this.id,
    required this.productCode,
    required this.name,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productCode: json["productCode"],
        name: json["name"],
        price: json["price"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productCode": productCode,
        "name": name,
        "price": price.toString(),
      };
}

class Customer {
  final int id;
  final String name;
  final String email;
  final String phone;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
      };
}

class Promotion {
  final int id;
  final int promotionTypeId;
  final String name;
  final String policy;
  final DateTime expirationDate;
  final String description;

  Promotion({
    required this.id,
    required this.promotionTypeId,
    required this.name,
    required this.policy,
    required this.expirationDate,
    required this.description,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        id: json["id"],
        promotionTypeId: json["promotionTypeId"],
        name: json["name"],
        policy: json["policy"],
        expirationDate: DateTime.parse(json["expirationDate"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "promotionTypeId": promotionTypeId,
        "name": name,
        "policy": policy,
        "expirationDate": expirationDate.toIso8601String(),
        "description": description,
      };
}

class Metadata {
  final int page;
  final int size;
  final int total;

  Metadata({
    required this.page,
    required this.size,
    required this.total,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        page: json["page"],
        size: json["size"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "size": size,
        "total": total,
      };
}
