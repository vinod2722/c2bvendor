// To parse this JSON data, do
//
//     final subCatModel = subCatModelFromJson(jsonString);

import 'dart:convert';

SubCatModel subCatModelFromJson(String str) => SubCatModel.fromJson(json.decode(str));

String subCatModelToJson(SubCatModel data) => json.encode(data.toJson());

class SubCatModel {
  int code;
  String status;
  String message;
  List<SubCategory> subCategories;

  SubCatModel({
    required this.code,
    required this.status,
    required this.message,
    required this.subCategories,
  });

  factory SubCatModel.fromJson(Map<String, dynamic> json) => SubCatModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    subCategories: List<SubCategory>.from(json["subCategories"].map((x) => SubCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "subCategories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
  };
}

class SubCategory {
  int id;
  String name;
  String categoryName;
  int categoryId;
  String imageUrl;
  dynamic vendorId;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  CategoryTableAssociation categoryTableAssociation;

  SubCategory({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.categoryId,
    required this.imageUrl,
    required this.vendorId,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.categoryTableAssociation,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    name: json["name"],
    categoryName: json["category_name"],
    categoryId: json["category_id"],
    imageUrl: json["image_url"],
    vendorId: json["vendor_id"],
    active: json["active"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    categoryTableAssociation: CategoryTableAssociation.fromJson(json["category_table_association"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category_name": categoryName,
    "category_id": categoryId,
    "image_url": imageUrl,
    "vendor_id": vendorId,
    "active": active,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "category_table_association": categoryTableAssociation.toJson(),
  };
}

class CategoryTableAssociation {
  int id;
  String categoryName;
  String tableName;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  CategoryTableAssociation({
    required this.id,
    required this.categoryName,
    required this.tableName,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory CategoryTableAssociation.fromJson(Map<String, dynamic> json) => CategoryTableAssociation(
    id: json["id"],
    categoryName: json["category_name"],
    tableName: json["table_name"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "table_name": tableName,
    "image": image,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
