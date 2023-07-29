import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    final String name;
    final String email;
    final String password;
    final String phone;

    SignupModel({
        required this.name,
        required this.email,
        required this.password,
        required this.phone,
    });

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
    };
}
