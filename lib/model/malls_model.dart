// To parse this JSON data, do
//
//     final mallsModel = mallsModelFromJson(jsonString);

import 'dart:convert';

MallsModel mallsModelFromJson(String str) => MallsModel.fromJson(json.decode(str));

String mallsModelToJson(MallsModel data) => json.encode(data.toJson());

class MallsModel {
  int code;
  String status;
  String message;
  List<Mall> malls;

  MallsModel({
    required this.code,
    required this.status,
    required this.message,
    required this.malls,
  });

  factory MallsModel.fromJson(Map<String, dynamic> json) => MallsModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    malls: List<Mall>.from(json["malls"].map((x) => Mall.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "malls": List<dynamic>.from(malls.map((x) => x.toJson())),
  };
}

class Mall {
  int id;
  String name;
  String address;
  String imageUrl;
  double lat;
  double lng;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Mall({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.lat,
    required this.lng,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Mall.fromJson(Map<String, dynamic> json) => Mall(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    imageUrl: json["image_url"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "image_url": imageUrl,
    "lat": lat,
    "lng": lng,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
