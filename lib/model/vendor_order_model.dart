// To parse this JSON data, do
//
//     final vendoeOrder = vendoeOrderFromJson(jsonString);

import 'dart:convert';

VendoeOrder vendoeOrderFromJson(String str) => VendoeOrder.fromJson(json.decode(str));

String vendoeOrderToJson(VendoeOrder data) => json.encode(data.toJson());

class VendoeOrder {
  int code;
  String status;
  String message;
  List<OrderElement> orders;

  VendoeOrder({
    required this.code,
    required this.status,
    required this.message,
    required this.orders,
  });

  factory VendoeOrder.fromJson(Map<String, dynamic> json) => VendoeOrder(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    orders: List<OrderElement>.from(json["orders"].map((x) => OrderElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class OrderElement {
  int id;
  int orderId;
  int productId;
  int categoryId;
  int subCategoryId;
  int deliveryTypeId;
  int price;
  int orderStatusId;
  dynamic trackingIdForDunzo;
  dynamic trackingLinkForDunzo;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  OrderOrder order;
  CategoryTableAssociation categoryTableAssociation;
  OrderStatus orderStatus;
  ProductVend product;

  OrderElement({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.categoryId,
    required this.subCategoryId,
    required this.deliveryTypeId,
    required this.price,
    required this.orderStatusId,
    required this.trackingIdForDunzo,
    required this.trackingLinkForDunzo,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.order,
    required this.categoryTableAssociation,
    required this.orderStatus,
    required this.product,
  });

  factory OrderElement.fromJson(Map<String, dynamic> json) => OrderElement(
    id: json["id"],
    orderId: json["order_id"],
    productId: json["product_id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    deliveryTypeId: json["delivery_type_id"],
    price: json["price"],
    orderStatusId: json["order_status_id"],
    trackingIdForDunzo: json["tracking_id_for_dunzo"],
    trackingLinkForDunzo: json["tracking_link_for_dunzo"],
    quantity: json["quantity"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    order: OrderOrder.fromJson(json["order"]),
    categoryTableAssociation: CategoryTableAssociation.fromJson(json["category_table_association"]),
    orderStatus: OrderStatus.fromJson(json["order_status"]),
    product: ProductVend.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "product_id": productId,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "delivery_type_id": deliveryTypeId,
    "price": price,
    "order_status_id": orderStatusId,
    "tracking_id_for_dunzo": trackingIdForDunzo,
    "tracking_link_for_dunzo": trackingLinkForDunzo,
    "quantity": quantity,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "order": order.toJson(),
    "category_table_association": categoryTableAssociation.toJson(),
    "order_status": orderStatus.toJson(),
    "product": product.toJson(),
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

class OrderOrder {
  int id;
  String ordId;
  int userId;
  int addressId;
  dynamic deliveryTypeId;
  int orderAmount;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Customer customer;

  OrderOrder({
    required this.id,
    required this.ordId,
    required this.userId,
    required this.addressId,
    required this.deliveryTypeId,
    required this.orderAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.customer,
  });

  factory OrderOrder.fromJson(Map<String, dynamic> json) => OrderOrder(
    id: json["id"],
    ordId: json["ord_id"],
    userId: json["user_id"],
    addressId: json["address_id"],
    deliveryTypeId: json["delivery_type_id"],
    orderAmount: json["order_amount"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ord_id": ordId,
    "user_id": userId,
    "address_id": addressId,
    "delivery_type_id": deliveryTypeId,
    "order_amount": orderAmount,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "customer": customer.toJson(),
  };
}

class Customer {
  int id;
  String fullname;
  String email;
  dynamic phone;
  dynamic altPhone;
  dynamic dob;
  dynamic language;
  int verified;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Customer({
    required this.id,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.altPhone,
    required this.dob,
    required this.language,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    fullname: json["fullname"],
    email: json["email"],
    phone: json["phone"],
    altPhone: json["alt_phone"],
    dob: json["dob"],
    language: json["language"],
    verified: json["verified"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "email": email,
    "phone": phone,
    "alt_phone": altPhone,
    "dob": dob,
    "language": language,
    "verified": verified,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}

class OrderStatus {
  int id;
  String statusName;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  OrderStatus({
    required this.id,
    required this.statusName,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
    id: json["id"],
    statusName: json["status_name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status_name": statusName,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}

class ProductVend {
  int id;
  String name;
  String description;
  bool approve;
  int storeId;
  int available;
  int soldCount;
  int quantity;
  dynamic tags;
  int price;
  int comparePrice;
  int gst;
  bool freeDelivery;
  dynamic freeDeliveryIfMore;
  int categoryId;
  String size;
  int vendorId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  CategoryTableAssociation categoryTableAssociation;

  ProductVend({
    required this.id,
    required this.name,
    required this.description,
    required this.approve,
    required this.storeId,
    required this.available,
    required this.soldCount,
    required this.quantity,
    required this.tags,
    required this.price,
    required this.comparePrice,
    required this.gst,
    required this.freeDelivery,
    required this.freeDeliveryIfMore,
    required this.categoryId,
    required this.size,
    required this.vendorId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.categoryTableAssociation,
  });

  factory ProductVend.fromJson(Map<String, dynamic> json) => ProductVend(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    approve: json["approve"],
    storeId: json["store_id"],
    available: json["available"],
    soldCount: json["sold_count"],
    quantity: json["quantity"],
    tags: json["tags"],
    price: json["price"],
    comparePrice: json["compare_price"],
    gst: json["gst"],
    freeDelivery: json["free_delivery"],
    freeDeliveryIfMore: json["free_delivery_if_more"],
    categoryId: json["category_id"],
    size: json["size"],
    vendorId: json["vendor_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    categoryTableAssociation: CategoryTableAssociation.fromJson(json["category_table_association"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "approve": approve,
    "store_id": storeId,
    "available": available,
    "sold_count": soldCount,
    "quantity": quantity,
    "tags": tags,
    "price": price,
    "compare_price": comparePrice,
    "gst": gst,
    "free_delivery": freeDelivery,
    "free_delivery_if_more": freeDeliveryIfMore,
    "category_id": categoryId,
    "size": size,
    "vendor_id": vendorId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "category_table_association": categoryTableAssociation.toJson(),
  };
}
