import 'dart:convert';

GetWishListModel getWishListModelFromJson(String str) =>
    GetWishListModel.fromJson(json.decode(str));

String getWishListModelToJson(GetWishListModel data) =>
    json.encode(data.toJson());

class GetWishListModel {
  final Metadata metadata;
  final List<Datum> data;
  final bool isError;
  final dynamic message;

  GetWishListModel({
    required this.metadata,
    required this.data,
    required this.isError,
    required this.message,
  });

  factory GetWishListModel.fromJson(Map<String, dynamic> json) =>
      GetWishListModel(
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
  final int accountId;
  final int productId;
  final Product product;

  Datum({
    required this.id,
    required this.accountId,
    required this.productId,
    required this.product,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        accountId: json["accountId"],
        productId: json["productId"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountId": accountId,
        "productId": productId,
        "product": product.toJson(),
      };
}

class Product {
  final int id;
  final String productCode;
  final String name;
  final String description;
  final String price;
  final bool isActive;
  final DateTime execptedReleaseDate;
  final Category category;
  final List<ProductDetail> productDetails;

  Product({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.price,
    required this.isActive,
    required this.execptedReleaseDate,
    required this.category,
    required this.productDetails,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productCode: json["productCode"],
        name: json["name"],
        description: json["description"],
        price: json["price"].toString(),
        isActive: json["isActive"],
        execptedReleaseDate: DateTime.parse(json["execptedReleaseDate"]),
        category: Category.fromJson(json["category"]),
        productDetails: List<ProductDetail>.from(
            json["productDetails"].map((x) => ProductDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productCode": productCode,
        "name": name,
        "description": description,
        "price": price.toString(),
        "isActive": isActive,
        "execptedReleaseDate": execptedReleaseDate.toIso8601String(),
        "category": category.toJson(),
        "productDetails":
            List<dynamic>.from(productDetails.map((x) => x.toJson())),
      };
}

class Category {
  final int id;
  final String name;
  final bool isActive;
  final DateTime createAt;
  final dynamic updateAt;

  Category({
    required this.id,
    required this.name,
    required this.isActive,
    required this.createAt,
    required this.updateAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        createAt: DateTime.parse(json["createAt"]),
        updateAt: json["updateAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "createAt": createAt.toIso8601String(),
        "updateAt": updateAt,
      };
}

class ProductDetail {
  final int id;
  final int productId;
  final dynamic size;
  final dynamic color;
  final String imgUrl;
  final String width;
  final String height;
  final dynamic material;
  final String description;
  final dynamic updateAt;

  ProductDetail({
    required this.id,
    required this.productId,
    required this.size,
    required this.color,
    required this.imgUrl,
    required this.width,
    required this.height,
    required this.material,
    required this.description,
    required this.updateAt,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        productId: json["productId"],
        size: json["size"],
        color: json["color"],
        imgUrl: json["imgUrl"],
        width: json["width"].toString(),
        height: json["height"].toString(),
        material: json["material"],
        description: json["description"],
        updateAt: json["updateAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "size": size,
        "color": color,
        "imgUrl": imgUrl,
        "width": width.toString(),
        "height": height.toString(),
        "material": material,
        "description": description,
        "updateAt": updateAt,
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
