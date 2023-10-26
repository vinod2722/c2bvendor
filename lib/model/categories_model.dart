// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  int code;
  String status;
  String message;
  List<Category> categories;
  List<Service> services;

  CategoryModel({
    required this.code,
    required this.status,
    required this.message,
    required this.categories,
    required this.services,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String categoryName;
  String tableName;
  String image;

  Category({
    required this.id,
    required this.categoryName,
    required this.tableName,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class Service {
  int id;
  String name;
  String image;

  Service({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
