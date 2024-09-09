// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? uid;
  String? email;
  String? phone;
  String? address;
  String? token;

  UserModel({
    this.uid,
    this.email,
    this.phone,
    this.address,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "phone": phone,
        "address": address,
        "token": token,
      };
}
