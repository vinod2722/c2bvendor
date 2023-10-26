// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int code;
  String message;
  User user;

  UserModel({
    required this.code,
    required this.message,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    code: json["code"],
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String fullname;
  String email;
  String role;
  String application;
  int iat;
  int exp;

  User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.role,
    required this.application,
    required this.iat,
    required this.exp,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullname: json["fullname"],
    email: json["email"] ?? "",
    role: json["role"],
    application: json["application"],
    iat: json["iat"],
    exp: json["exp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "email": email,
    "role": role,
    "application": application,
    "iat": iat,
    "exp": exp,
  };
}
