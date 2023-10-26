// To parse this JSON data, do
//
//     final deliveryType = deliveryTypeFromJson(jsonString);

import 'dart:convert';

DeliveryType deliveryTypeFromJson(String str) => DeliveryType.fromJson(json.decode(str));

String deliveryTypeToJson(DeliveryType data) => json.encode(data.toJson());

class DeliveryType {
  int code;
  String status;
  String message;
  List<DeliveryTypeElement> deliveryTypes;

  DeliveryType({
    required this.code,
    required this.status,
    required this.message,
    required this.deliveryTypes,
  });

  factory DeliveryType.fromJson(Map<String, dynamic> json) => DeliveryType(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    deliveryTypes: List<DeliveryTypeElement>.from(json["delivery_types"].map((x) => DeliveryTypeElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "delivery_types": List<dynamic>.from(deliveryTypes.map((x) => x.toJson())),
  };
}

class DeliveryTypeElement {
  int id;
  String type;

  DeliveryTypeElement({
    required this.id,
    required this.type,
  });

  factory DeliveryTypeElement.fromJson(Map<String, dynamic> json) => DeliveryTypeElement(
    id: json["id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
  };
}
