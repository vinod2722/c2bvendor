// To parse this JSON data, do
//
//     final banksModel = banksModelFromJson(jsonString);

import 'dart:convert';

BanksModel banksModelFromJson(String str) => BanksModel.fromJson(json.decode(str));

String banksModelToJson(BanksModel data) => json.encode(data.toJson());

class BanksModel {
  int code;
  String status;
  String message;
  List<BankList> bankList;

  BanksModel({
    required this.code,
    required this.status,
    required this.message,
    required this.bankList,
  });

  factory BanksModel.fromJson(Map<String, dynamic> json) => BanksModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    //bankList: List<BankList>.from(json["bank_list"].map((x) => BankList.fromJson(x))),
    bankList: (json["bank_list"] as List<dynamic>?)
        ?.map((x) => BankList.fromJson(x))
        .toList() ?? [],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "bank_list": List<dynamic>.from(bankList.map((x) => x.toJson())),
  };
}

class BankList {
  int id;
  String bankName;
  dynamic bankLogoUrl;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;

  BankList({
    required this.id,
    required this.bankName,
    required this.bankLogoUrl,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.deletedAt,
  });

  factory BankList.fromJson(Map<String, dynamic> json) => BankList(
    id: json["id"],
    bankName: json["bank_name"],
    bankLogoUrl: json["bank_logo_url"],
    // createdAt: DateTime.parse(json["createdAt"] ?? ""),
    // updatedAt: DateTime.parse(json["updatedAt"]),
    //deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bank_name": bankName,
    "bank_logo_url": bankLogoUrl,
    // "createdAt": createdAt.toIso8601String(),
    // "updatedAt": updatedAt.toIso8601String(),
    // "deletedAt": deletedAt,
  };
}
