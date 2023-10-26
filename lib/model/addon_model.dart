// To parse this JSON data, do
//
//     final addonModel = addonModelFromJson(jsonString);

import 'dart:convert';

AddonModel addonModelFromJson(String str) => AddonModel.fromJson(json.decode(str));

String addonModelToJson(AddonModel data) => json.encode(data.toJson());

class AddonModel {
  int code;
  String status;
  String message;
  List<AddOn> addOns;

  AddonModel({
    required this.code,
    required this.status,
    required this.message,
    required this.addOns,
  });

  factory AddonModel.fromJson(Map<String, dynamic> json) => AddonModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    addOns: List<AddOn>.from(json["addOns"].map((x) => AddOn.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "addOns": List<dynamic>.from(addOns.map((x) => x.toJson())),
  };
}

class AddOn {
  int id;
  String name;
  int price;
  int comparedPrice;
  int available;
  int vendorId;
  int approve;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  AddOn({
    required this.id,
    required this.name,
    required this.price,
    required this.comparedPrice,
    required this.available,
    required this.vendorId,
    required this.approve,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    comparedPrice: json["compared_price"],
    available: json["available"],
    vendorId: json["vendor_id"],
    approve: json["approve"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "compared_price": comparedPrice,
    "available": available,
    "vendor_id": vendorId,
    "approve": approve,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
