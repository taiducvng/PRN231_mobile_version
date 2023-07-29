import 'dart:convert';

GetOrderByUserIdModel getOrderByUserIdModelFromJson(String str) =>
    GetOrderByUserIdModel.fromJson(json.decode(str));

String getOrderByUserIdModelToJson(GetOrderByUserIdModel data) =>
    json.encode(data.toJson());

class GetOrderByUserIdModel {
  final Metadata metadata;
  final List<Datum> data;
  final bool isError;
  final dynamic message;

  GetOrderByUserIdModel({
    required this.metadata,
    required this.data,
    required this.isError,
    required this.message,
  });

  factory GetOrderByUserIdModel.fromJson(Map<String, dynamic> json) =>
      GetOrderByUserIdModel(
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
  final String orderCode;
  final Customer customer;
  final PaymentType paymentType;
  final String deliveryPhone;
  final DateTime checkInDate;
  final String totalAmount;
  final String discountRate;
  final String finalAmount;
  final String shippingFee;
  final String orderStatus;
  final bool isConfirm;
  final int quantity;
  final Note note;
  final List<OrderDetail> orderDetails;

  Datum({
    required this.id,
    required this.orderCode,
    required this.customer,
    required this.paymentType,
    required this.deliveryPhone,
    required this.checkInDate,
    required this.totalAmount,
    required this.discountRate,
    required this.finalAmount,
    required this.shippingFee,
    required this.orderStatus,
    required this.isConfirm,
    required this.quantity,
    required this.note,
    required this.orderDetails,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderCode: json["orderCode"],
        customer: Customer.fromJson(json["customer"]),
        paymentType: PaymentType.fromJson(json["paymentType"]),
        deliveryPhone: json["deliveryPhone"],
        checkInDate: DateTime.parse(json["checkInDate"]),
        totalAmount: json["totalAmount"].toString(),
        discountRate: json["discountRate"].toString(),
        finalAmount: json["finalAmount"].toString(),
        shippingFee: json["shippingFee"].toString(),
        orderStatus: json["orderStatus"],
        isConfirm: json["isConfirm"],
        quantity: json["quantity"],
        note: noteValues.map[json["note"]]!,
        orderDetails: List<OrderDetail>.from(
            json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderCode": orderCode,
        "customer": customer.toJson(),
        "paymentType": paymentType.toJson(),
        "deliveryPhone": deliveryPhone,
        "checkInDate": checkInDate.toIso8601String(),
        "totalAmount": totalAmount.toString(),
        "discountRate": discountRate.toString(),
        "finalAmount": finalAmount.toString(),
        "shippingFee": shippingFee.toString(),
        "orderStatus": orderStatus,
        "isConfirm": isConfirm,
        "quantity": quantity,
        "note": noteValues.reverse[note],
        "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
      };
}

class Customer {
  final int id;
  final int roleId;
  final Note name;
  final Email email;
  final String phone;

  final bool isActive;

  Customer({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.phone,
    required this.isActive,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        roleId: json["roleId"],
        name: noteValues.map[json["name"]]!,
        email: emailValues.map[json["email"]]!,
        phone: json["phone"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "roleId": roleId,
        "name": noteValues.reverse[name],
        "email": emailValues.reverse[email],
        "phone": phone,
        "isActive": isActive,
      };
}

enum Email { STRING_GMAIL_COM }

final emailValues = EnumValues({"string@gmail.com": Email.STRING_GMAIL_COM});

enum Note { NO, NOTHING, STRING }

final noteValues =
    EnumValues({"no": Note.NO, "nothing": Note.NOTHING, "string": Note.STRING});

class OrderDetail {
  final int id;
  final int orderId;
  final ProductCode productCode;
  final ProductName? productName;
  final String unitPrice;
  final int quantity;
  final String totalAmount;
  final String discountRate;
  final String finalAmount;
  final Note note;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.productCode,
    required this.productName,
    required this.unitPrice,
    required this.quantity,
    required this.totalAmount,
    required this.discountRate,
    required this.finalAmount,
    required this.note,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["orderId"],
        productCode: productCodeValues.map[json["productCode"]]!,
        productName: productNameValues.map[json["productName"]],
        unitPrice: json["unitPrice"].toString(),
        quantity: json["quantity"],
        totalAmount: json["totalAmount"].toString(),
        discountRate: json["discountRate"].toString(),
        finalAmount: json["finalAmount"].toString(),
        note: noteValues.map[json["note"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderId": orderId,
        "productCode": productCodeValues.reverse[productCode],
        "productName": productNameValues.reverse[productName],
        "unitPrice": unitPrice.toString(),
        "quantity": quantity,
        "totalAmount": totalAmount.toString(),
        "discountRate": discountRate.toString(),
        "finalAmount": finalAmount.toString(),
        "note": noteValues.reverse[note],
      };
}

enum ProductCode { DT30, LOA1121, LOA1122, LOA1123, MT30, MV3_P }

final productCodeValues = EnumValues({
  "DT30      ": ProductCode.DT30,
  "LOA1121   ": ProductCode.LOA1121,
  "LOA1122   ": ProductCode.LOA1122,
  "LOA1123   ": ProductCode.LOA1123,
  "MT30      ": ProductCode.MT30,
  "MV3P      ": ProductCode.MV3_P
});

enum ProductName {
  FLYCAM_DJI_MATRICE_M30_T,
  FLYCAM_DJI_T30,
  LOA_DI_NG_JBL_BOOMBOX,
  LOA_DI_NG_LG_XBOOM_GO_PN7,
  LOA_DI_NG_V5
}

final productNameValues = EnumValues({
  "Flycam DJI Matrice M30T": ProductName.FLYCAM_DJI_MATRICE_M30_T,
  "Flycam DJI T30": ProductName.FLYCAM_DJI_T30,
  "LOA DI ĐỘNG JBL BOOMBOX": ProductName.LOA_DI_NG_JBL_BOOMBOX,
  "Loa di động LG XBOOM Go PN7": ProductName.LOA_DI_NG_LG_XBOOM_GO_PN7,
  "Loa di động - V5": ProductName.LOA_DI_NG_V5
});

class PaymentType {
  final PaymentMethod paymentMethod;

  PaymentType({
    required this.paymentMethod,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        paymentMethod: paymentMethodValues.map[json["paymentMethod"]]!,
      );

  Map<String, dynamic> toJson() => {
        "paymentMethod": paymentMethodValues.reverse[paymentMethod],
      };
}

enum PaymentMethod { CASH, MOMO, VN_PAY }

final paymentMethodValues = EnumValues({
  "Cash": PaymentMethod.CASH,
  "Momo": PaymentMethod.MOMO,
  "VNPay": PaymentMethod.VN_PAY
});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
