// To parse this JSON data, do
//
//     final selectedCatModel = selectedCatModelFromJson(jsonString);

import 'dart:convert';

SelectedCatModel selectedCatModelFromJson(String str) => SelectedCatModel.fromJson(json.decode(str));

String selectedCatModelToJson(SelectedCatModel data) => json.encode(data.toJson());

class SelectedCatModel {
  int code;
  String status;
  String message;
  List<ProductType> productTypes;

  SelectedCatModel({
    required this.code,
    required this.status,
    required this.message,
    required this.productTypes,
  });

  factory SelectedCatModel.fromJson(Map<String, dynamic> json) => SelectedCatModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    productTypes: List<ProductType>.from(json["product_types"].map((x) => ProductType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "product_types": List<dynamic>.from(productTypes.map((x) => x.toJson())),
  };
}

class ProductType {
  int id;
  String categoryName;
  String tableName;
  String image;

  ProductType({
    required this.id,
    required this.categoryName,
    required this.tableName,
    required this.image,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
    id: json["id"],
    categoryName: json["category_name"],
    tableName: json["table_name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "table_name": tableName,
    "image": image,
  };
}
