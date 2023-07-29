import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    final Data data;

    LoginResponseModel({
        required this.data,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    final String accessToken;
    final String name;
    final int roles;

    Data({
        required this.accessToken,
        required this.name,
        required this.roles,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        name: json["name"],
        roles: json["roles"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "name": name,
        "roles": roles,
    };
}