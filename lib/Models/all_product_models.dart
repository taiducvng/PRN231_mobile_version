import 'dart:convert';

AllProductsModel allProductsModelFromJson(String str) =>
    AllProductsModel.fromJson(json.decode(str));

String allProductsModelToJson(AllProductsModel data) =>
    json.encode(data.toJson());

class AllProductsModel {
  final Metadata metadata;
  final List<Datum> data;
  final bool isError;
  final dynamic message;

  AllProductsModel({
    required this.metadata,
    required this.data,
    required this.isError,
    required this.message,
  });

  factory AllProductsModel.fromJson(Map<String, dynamic> json) =>
      AllProductsModel(
        metadata: Metadata.fromJson(json["metadata"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            .toList(),
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
  final String productCode;
  final String name;
  final String description;
  final double price;
  final bool isActive;
  final String? execptedReleaseDate;
  final List<ProductDetail> productDetails;

  Datum({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.price,
    required this.isActive,
    required this.execptedReleaseDate,
    required this.productDetails,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productCode: json["productCode"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        isActive: json["isActive"],
        execptedReleaseDate: json["execptedReleaseDate"],
        productDetails: List<ProductDetail>.from(
            json["productDetails"].map((x) => ProductDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productCode": productCode,
        "name": name,
        "description": description,
        "price": price,
        "isActive": isActive,
        "execptedReleaseDate": execptedReleaseDate,
        "productDetails":
            List<dynamic>.from(productDetails.map((x) => x.toJson())),
      };
}

class ProductDetail {
  final int id;
  final int productId;
  final dynamic size;
  final dynamic color;
  final String imgUrl;
  final dynamic width;
  final dynamic height;
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
        width: json["width"],
        height: json["height"],
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
        "width": width,
        "height": height,
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
