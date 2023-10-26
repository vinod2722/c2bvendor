// // To parse this JSON data, do
// //
// //     final productResponse = productResponseFromJson(jsonString);
//
import 'dart:convert';

productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
  int code;
  String status;
  String message;
  List<Vendor> vendors;
  List<Product> products;

  ProductResponse({
    required this.code,
    required this.status,
    required this.message,
    required this.vendors,
    required this.products,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    //vendors: List<Vendor>.from(json["vendors"].map((x) => Vendor.fromJson(x))),
    vendors: json["vendors"] != null
        ? List<Vendor>.from(json["vendors"].map((x) => Vendor.fromJson(x)))
        : [],
    products: json["products"] != null
        ? List<Product>.from(json["products"].map((x) => Product.fromJson(x)))
        : [],
    //products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "vendors": List<dynamic>.from(vendors.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  int id;
  String name;
  String description;
  bool approve;
  bool negotiation;
  int storeId;
  int availableStocks;
  int soldStocks;
  String highlight;
  dynamic specifications;
  double price;
  double comparePrice;
  int gst;
  bool freeDelivery;
  int freeDeliveryIfMore;
  bool exchangeAvailable;
  bool cancellationAvailable;
  int categoryId;
  String exchangePolicy;
  String cancellationPolicy;
  String size;
  String color;
  dynamic height;
  dynamic width;
  dynamic length;
  dynamic weight;
  int vendorId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<ImagesOfProduct> imagesOfProducts;
  CategoryTableAssociation categoryTableAssociation;
  dynamic vendorSubCategoryProductAssociation;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.approve,
    required this.negotiation,
    required this.storeId,
    required this.availableStocks,
    required this.soldStocks,
    required this.highlight,
    required this.specifications,
    required this.price,
    required this.comparePrice,
    required this.gst,
    required this.freeDelivery,
    required this.freeDeliveryIfMore,
    required this.exchangeAvailable,
    required this.cancellationAvailable,
    required this.categoryId,
    required this.exchangePolicy,
    required this.cancellationPolicy,
    required this.size,
    required this.color,
    required this.height,
    required this.width,
    required this.length,
    required this.weight,
    required this.vendorId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.imagesOfProducts,
    required this.categoryTableAssociation,
    required this.vendorSubCategoryProductAssociation,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    approve: json["approve"],
    negotiation: json["negotiation"] ?? false,
    storeId: json["store_id"] ?? 0,
    availableStocks: json["available_stocks"] ?? 0,
    soldStocks: json["sold_stocks"] ?? 0,
    highlight: json["highlight"] ?? "",
    specifications: json["specifications"],
    // price: json["price"],
    price: json["price"] is double
        ? json["price"]
        : (json["price"] is int
        ? json["price"].toDouble()
        : 0.0),
    //comparePrice: json["compare_price"],
    comparePrice: json["compare_price"] is double
        ? json["compare_price"]
        : (json["compare_price"] is int
        ? json["compare_price"].toDouble()
        : 0.0),
    gst: json["gst"],
    freeDelivery: json["free_delivery"],
    freeDeliveryIfMore: json["free_delivery_if_more"] ?? 0,
    //exchangeAvailable: json["exchange_available"] ?? false,
    exchangeAvailable: json["exchange_available"] == null ? false : json["exchange_available"] as bool,
    cancellationAvailable: json["cancellation_available"] ?? false,
    categoryId: json["category_id"],
    exchangePolicy: json["exchange_policy"] ?? "",
    cancellationPolicy: json["cancellation_policy"] ?? "",
    size: json["size"],
    color: json["color"] ?? "",
    height: json["height"],
    width: json["width"],
    length: json["length"],
    weight: json["weight"],
    vendorId: json["vendor_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    imagesOfProducts: List<ImagesOfProduct>.from(json["images_of_products"].map((x) => ImagesOfProduct.fromJson(x))),
    categoryTableAssociation: CategoryTableAssociation.fromJson(json["category_table_association"]),
    vendorSubCategoryProductAssociation: json["vendor_sub_category_product_association"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "approve": approve,
    "negotiation": negotiation,
    "store_id": storeId,
    "available_stocks": availableStocks,
    "sold_stocks": soldStocks,
    "highlight": highlight,
    "specifications": specifications,
    "price": price,
    "compare_price": comparePrice,
    "gst": gst,
    "free_delivery": freeDelivery,
    "free_delivery_if_more": freeDeliveryIfMore,
    "exchange_available": exchangeAvailable,
    "cancellation_available": cancellationAvailable,
    "category_id": categoryId,
    "exchange_policy": exchangePolicy,
    "cancellation_policy": cancellationPolicy,
    "size": size,
    "color": color,
    "height": height,
    "width": width,
    "length": length,
    "weight": weight,
    "vendor_id": vendorId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "images_of_products": List<dynamic>.from(imagesOfProducts.map((x) => x.toJson())),
    "category_table_association": categoryTableAssociation.toJson(),
    "vendor_sub_category_product_association": vendorSubCategoryProductAssociation,
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

class ImagesOfProduct {
  int id;
  String productTable;
  int productId;
  String imageUrl;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  ImagesOfProduct({
    required this.id,
    required this.productTable,
    required this.productId,
    required this.imageUrl,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory ImagesOfProduct.fromJson(Map<String, dynamic> json) => ImagesOfProduct(
    id: json["id"],
    productTable: json["product_table"],
    productId: json["product_id"],
    imageUrl: json["image_url"],
    active: json["active"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_table": productTable,
    "product_id": productId,
    "image_url": imageUrl,
    "active": active,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}

class Vendor {
  int id;
  bool verified;
  bool approved;
  String fullname;
  String firstName;
  String lastName;
  String dob;
  String gender;
  String language;
  String email;
  String personalEmail;
  String personalMobile;
  String personalAltMobile;
  String add1;
  String add2;
  String area;
  String city;
  String state;
  String pincode;
  String landmark;
  double lat;
  double lng;
  dynamic identityProofName;
  dynamic identityProofFileUrl;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Store store;
  List<VendorProductAssociation> vendorProductAssociations;
  List<dynamic> foods;
  List<dynamic> electronics;
  List<Product> fashions;
  List<dynamic> groceries;
  List<dynamic> hardwares;
  List<dynamic> healthBeauties;
  List<dynamic> homeDecores;
  String distanceText;
  double distance;
  bool availableInLocation;
  String duration;
  List<Product> products;

  Vendor({
    required this.id,
    required this.verified,
    required this.approved,
    required this.fullname,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.language,
    required this.email,
    required this.personalEmail,
    required this.personalMobile,
    required this.personalAltMobile,
    required this.add1,
    required this.add2,
    required this.area,
    required this.city,
    required this.state,
    required this.pincode,
    required this.landmark,
    required this.lat,
    required this.lng,
    required this.identityProofName,
    required this.identityProofFileUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.store,
    required this.vendorProductAssociations,
    required this.foods,
    required this.electronics,
    required this.fashions,
    required this.groceries,
    required this.hardwares,
    required this.healthBeauties,
    required this.homeDecores,
    required this.distanceText,
    required this.distance,
    required this.availableInLocation,
    required this.duration,
    required this.products,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    verified: json["verified"],
    approved: json["approved"],
    fullname: json["fullname"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    dob: json["dob"],
    gender: json["gender"],
    language: json["language"],
    email: json["email"] ?? "",
    personalEmail: json["personal_email"],
    personalMobile: json["personal_mobile"],
    personalAltMobile: json["personal_alt_mobile"],
    add1: json["add1"],
    add2: json["add2"],
    area: json["area"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    landmark: json["landmark"],
    lat: json["lat"]?.toDouble() ?? 0.0,
    lng: json["lng"]?.toDouble() ?? 0.0,
    identityProofName: json["identity_proof_name"],
    identityProofFileUrl: json["identity_proof_file_url"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    store: Store.fromJson(json["store"]),
    vendorProductAssociations: List<VendorProductAssociation>.from(json["vendor_product_associations"].map((x) => VendorProductAssociation.fromJson(x))),
    //foods: List<dynamic>.from(json["foods"].map((x) => x)),
    foods: json["foods"] != null
        ? List<dynamic>.from(json["foods"].map((x) => x))
        : [],
    // electronics: List<dynamic>.from(json["electronics"].map((x) => x)),
    electronics: json["electronics"] != null
        ? List<Product>.from(json["electronics"].map((x) => Product.fromJson(x)))
        : [],
    //fashions: List<Product>.from(json["fashions"].map((x) => Product.fromJson(x))),
    fashions: json["fashions"] != null
        ? List<Product>.from(json["fashions"].map((x) => Product.fromJson(x)))
        : [],
    //groceries: List<dynamic>.from(json["groceries"].map((x) => x)),
    groceries: json["groceries"] != null
        ? List<Product>.from(json["groceries"].map((x) => Product.fromJson(x)))
        : [],
    hardwares: json["hardwares"] != null
        ? List<Product>.from(json["hardwares"].map((x) => Product.fromJson(x)))
        : [],
    healthBeauties: json["healthBeauties"] != null
        ? List<Product>.from(json["healthBeauties"].map((x) => Product.fromJson(x)))
        : [],
    homeDecores: json["homeDecores"] != null
        ? List<Product>.from(json["homeDecores"].map((x) => Product.fromJson(x)))
        : [],
    // hardwares: List<dynamic>.from(json["hardwares"].map((x) => x)),
    // healthBeauties: List<dynamic>.from(json["health_beauties"].map((x) => x)),
    // homeDecores: List<dynamic>.from(json["home_decores"].map((x) => x)),
    distanceText: json["distance_text"] ?? "",
    distance: json["distance"]?.toDouble() ?? 0.0,
    availableInLocation: json["available_in_location"] ?? false,
    duration: json["duration"] ?? "",
    //products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    // products: json["products"] != null
    //     ? List<Product>.from(json["products"].map((x) => Product.fromJson(x)))
    //     : [],
    //products: (json["products"] as List<dynamic>?)?.map((x) => Product.fromJson(x)).toList() ?? [],
    products: json["products"] != null
        ? List<Product>.from((json["products"] as List<dynamic>).map((x) => Product.fromJson(x)))
        : [],



  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "verified": verified,
    "approved": approved,
    "fullname": fullname,
    "first_name": firstName,
    "last_name": lastName,
    "dob": dob,
    "gender": gender,
    "language": language,
    "email": email,
    "personal_email": personalEmail,
    "personal_mobile": personalMobile,
    "personal_alt_mobile": personalAltMobile,
    "add1": add1,
    "add2": add2,
    "area": area,
    "city": city,
    "state": state,
    "pincode": pincode,
    "landmark": landmark,
    "lat": lat,
    "lng": lng,
    "identity_proof_name": identityProofName,
    "identity_proof_file_url": identityProofFileUrl,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "store": store.toJson(),
    "vendor_product_associations": List<dynamic>.from(vendorProductAssociations.map((x) => x.toJson())),
    "foods": List<dynamic>.from(foods.map((x) => x)),
    "electronics": List<dynamic>.from(electronics.map((x) => x)),
    "fashions": List<dynamic>.from(fashions.map((x) => x.toJson())),
    "groceries": List<dynamic>.from(groceries.map((x) => x)),
    "hardwares": List<dynamic>.from(hardwares.map((x) => x)),
    "health_beauties": List<dynamic>.from(healthBeauties.map((x) => x)),
    "home_decores": List<dynamic>.from(homeDecores.map((x) => x)),
    "distance_text": distanceText,
    "distance": distance,
    "available_in_location": availableInLocation,
    "duration": duration,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Store {
  int id;
  bool approved;
  String name;
  String gstNumber;
  String fssaiNumber;
  String mobile;
  String altMobile;
  String email;
  String add1;
  String add2;
  String area;
  String city;
  String state;
  String pincode;
  String landmark;
  double lat;
  double lng;
  int vendorId;
  int serviceRadius;
  String storeImageUrl;
  String typeMarketPlace;
  bool isOpen;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Store({
    required this.id,
    required this.approved,
    required this.name,
    required this.gstNumber,
    required this.fssaiNumber,
    required this.mobile,
    required this.altMobile,
    required this.email,
    required this.add1,
    required this.add2,
    required this.area,
    required this.city,
    required this.state,
    required this.pincode,
    required this.landmark,
    required this.lat,
    required this.lng,
    required this.vendorId,
    required this.serviceRadius,
    required this.storeImageUrl,
    required this.typeMarketPlace,
    required this.isOpen,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    approved: json["approved"],
    name: json["name"],
    gstNumber: json["gst_number"],
    fssaiNumber: json["fssai_number"],
    mobile: json["mobile"],
    altMobile: json["alt_mobile"],
    email: json["email"],
    add1: json["add1"],
    add2: json["add2"],
    area: json["area"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    landmark: json["landmark"],
    lat: json["lat"]?.toDouble() ?? 0.0,
    lng: json["lng"]?.toDouble() ?? 0.0,
    vendorId: json["vendor_id"],
    serviceRadius: json["service_radius"],
    storeImageUrl: json["store_image_url"] ?? "",
    typeMarketPlace: json["type_market_place"],
    isOpen: json["is_open"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "approved": approved,
    "name": name,
    "gst_number": gstNumber,
    "fssai_number": fssaiNumber,
    "mobile": mobile,
    "alt_mobile": altMobile,
    "email": email,
    "add1": add1,
    "add2": add2,
    "area": area,
    "city": city,
    "state": state,
    "pincode": pincode,
    "landmark": landmark,
    "lat": lat,
    "lng": lng,
    "vendor_id": vendorId,
    "service_radius": serviceRadius,
    "store_image_url": storeImageUrl,
    "type_market_place": typeMarketPlace,
    "is_open": isOpen,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}

class VendorProductAssociation {
  int id;
  int vendorId;
  String tableName;
  int tableId;
  String categoryName;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  CategoryTableAssociation categoryTableAssociation;

  VendorProductAssociation({
    required this.id,
    required this.vendorId,
    required this.tableName,
    required this.tableId,
    required this.categoryName,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.categoryTableAssociation,
  });

  factory VendorProductAssociation.fromJson(Map<String, dynamic> json) => VendorProductAssociation(
    id: json["id"],
    vendorId: json["vendor_id"],
    tableName: json["table_name"],
    tableId: json["table_id"],
    categoryName: json["category_name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    categoryTableAssociation: CategoryTableAssociation.fromJson(json["category_table_association"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_id": vendorId,
    "table_name": tableName,
    "table_id": tableId,
    "category_name": categoryName,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "category_table_association": categoryTableAssociation.toJson(),
  };
}

/////////?Above one is working ///////////
// import 'dart:convert';
//
// ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));
//
// String productResponseToJson(ProductResponse data) => json.encode(data.toJson());
//
// class ProductResponse {
//   int? code;
//   String? status;
//   String? message;
//   List<Vendor>? vendors;
//   List<Product>? products;
//
//   ProductResponse({
//     this.code,
//     this.status,
//     this.message,
//     this.vendors,
//     this.products,
//   });
//
//   factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
//     code: json["code"],
//     status: json["status"],
//     message: json["message"],
//     vendors: List<Vendor>.from(json["vendors"].map((x) => Vendor.fromJson(x))),
//     products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "code": code,
//     "status": status,
//     "message": message,
//     "vendors": List<dynamic>.from(vendors!.map((x) => x.toJson())),
//     "products": List<dynamic>.from(products!.map((x) => x.toJson())),
//   };
// }
//
// class Product {
//   int? id;
//   String? name;
//   String? description;
//   bool? approve;
//   bool? negotiation;
//   int? storeId;
//   int? availableStocks;
//   int? soldStocks;
//   String? highlight;
//   dynamic specifications;
//   int? price;
//   int? comparePrice;
//   int? gst;
//   bool? freeDelivery;
//   int? freeDeliveryIfMore;
//   bool? exchangeAvailable;
//   bool? cancellationAvailable;
//   int? categoryId;
//   String? exchangePolicy;
//   String? cancellationPolicy;
//   String? size;
//   String? color;
//   dynamic height;
//   dynamic width;
//   dynamic length;
//   dynamic weight;
//   int? vendorId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic deletedAt;
//   List<ImagesOfProduct>? imagesOfProducts;
//   CategoryTableAssociation? categoryTableAssociation;
//   dynamic vendorSubCategoryProductAssociation;
//
//   Product({
//     this.id,
//     this.name,
//     this.description,
//     this.approve,
//     this.negotiation,
//     this.storeId,
//     this.availableStocks,
//     this.soldStocks,
//     this.highlight,
//     this.specifications,
//     this.price,
//     this.comparePrice,
//     this.gst,
//     this.freeDelivery,
//     this.freeDeliveryIfMore,
//     this.exchangeAvailable,
//     this.cancellationAvailable,
//     this.categoryId,
//     this.exchangePolicy,
//     this.cancellationPolicy,
//     this.size,
//     this.color,
//     this.height,
//     this.width,
//     this.length,
//     this.weight,
//     this.vendorId,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.imagesOfProducts,
//     this.categoryTableAssociation,
//     this.vendorSubCategoryProductAssociation,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     name: json["name"],
//     description: json["description"],
//     approve: json["approve"],
//     negotiation: json["negotiation"],
//     storeId: json["store_id"],
//     availableStocks: json["available_stocks"],
//     soldStocks: json["sold_stocks"],
//     highlight: json["highlight"],
//     specifications: json["specifications"],
//     price: json["price"],
//     comparePrice: json["compare_price"],
//     gst: json["gst"],
//     freeDelivery: json["free_delivery"],
//     freeDeliveryIfMore: json["free_delivery_if_more"],
//     exchangeAvailable: json["exchange_available"],
//     cancellationAvailable: json["cancellation_available"],
//     categoryId: json["category_id"],
//     exchangePolicy: json["exchange_policy"],
//     cancellationPolicy: json["cancellation_policy"],
//     size: json["size"],
//     color: json["color"],
//     height: json["height"],
//     width: json["width"],
//     length: json["length"],
//     weight: json["weight"],
//     vendorId: json["vendor_id"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     deletedAt: json["deletedAt"],
//     imagesOfProducts: List<ImagesOfProduct>.from(json["images_of_products"].map((x) => ImagesOfProduct.fromJson(x))),
//     categoryTableAssociation: CategoryTableAssociation.fromJson(json["category_table_association"]),
//     vendorSubCategoryProductAssociation: json["vendor_sub_category_product_association"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "description": description,
//     "approve": approve,
//     "negotiation": negotiation,
//     "store_id": storeId,
//     "available_stocks": availableStocks,
//     "sold_stocks": soldStocks,
//     "highlight": highlight,
//     "specifications": specifications,
//     "price": price,
//     "compare_price": comparePrice,
//     "gst": gst,
//     "free_delivery": freeDelivery,
//     "free_delivery_if_more": freeDeliveryIfMore,
//     "exchange_available": exchangeAvailable,
//     "cancellation_available": cancellationAvailable,
//     "category_id": categoryId,
//     "exchange_policy": exchangePolicy,
//     "cancellation_policy": cancellationPolicy,
//     "size": size,
//     "color": color,
//     "height": height,
//     "width": width,
//     "length": length,
//     "weight": weight,
//     "vendor_id": vendorId,
//     "createdAt": createdAt!.toIso8601String(),
//     "updatedAt": updatedAt!.toIso8601String(),
//     "deletedAt": deletedAt,
//     "images_of_products": List<dynamic>.from(imagesOfProducts!.map((x) => x.toJson())),
//     "category_table_association": categoryTableAssociation!.toJson(),
//     "vendor_sub_category_product_association": vendorSubCategoryProductAssociation,
//   };
// }
//
// class CategoryTableAssociation {
//   int? id;
//   String? categoryName;
//   String? tableName;
//   String? image;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic deletedAt;
//
//   CategoryTableAssociation({
//     this.id,
//     this.categoryName,
//     this.tableName,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//
//   factory CategoryTableAssociation.fromJson(Map<String, dynamic> json) => CategoryTableAssociation(
//     id: json["id"],
//     categoryName: json["category_name"],
//     tableName: json["table_name"],
//     image: json["image"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     deletedAt: json["deletedAt"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "category_name": categoryName,
//     "table_name": tableName,
//     "image": image,
//     "createdAt": createdAt!.toIso8601String(),
//     "updatedAt": updatedAt!.toIso8601String(),
//     "deletedAt": deletedAt,
//   };
// }
//
// class ImagesOfProduct {
//   int? id;
//   String? productTable;
//   int? productId;
//   String? imageUrl;
//   bool? active;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic deletedAt;
//
//   ImagesOfProduct({
//     this.id,
//     this.productTable,
//     this.productId,
//     this.imageUrl,
//     this.active,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//
//   factory ImagesOfProduct.fromJson(Map<String, dynamic> json) => ImagesOfProduct(
//     id: json["id"],
//     productTable: json["product_table"],
//     productId: json["product_id"],
//     imageUrl: json["image_url"],
//     active: json["active"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     deletedAt: json["deletedAt"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "product_table": productTable,
//     "product_id": productId,
//     "image_url": imageUrl,
//     "active": active,
//     "createdAt": createdAt!.toIso8601String(),
//     "updatedAt": updatedAt!.toIso8601String(),
//     "deletedAt": deletedAt,
//   };
// }
//
// class Vendor {
//   int? id;
//   bool? verified;
//   bool? approved;
//   String? fullname;
//   String? firstName;
//   String? lastName;
//   String? dob;
//   String? gender;
//   String? language;
//   String? email;
//   String? personalEmail;
//   String? personalMobile;
//   String? personalAltMobile;
//   String? add1;
//   String? add2;
//   String? area;
//   String? city;
//   String? state;
//   String? pincode;
//   String? landmark;
//   double? lat;
//   double? lng;
//   dynamic identityProofName;
//   dynamic identityProofFileUrl;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic deletedAt;
//   Store? store;
//   List<VendorProductAssociation>? vendorProductAssociations;
//   List<dynamic>? foods;
//   List<dynamic>? electronics;
//   List<Product>? fashions;
//   List<dynamic>? groceries;
//   List<dynamic>? hardwares;
//   List<dynamic>? healthBeauties;
//   List<dynamic>? homeDecores;
//   String? distanceText;
//   double? distance;
//   bool? availableInLocation;
//   String? duration;
//   List<Product>? products;
//
//   Vendor({
//     this.id,
//     this.verified,
//     this.approved,
//     this.fullname,
//     this.firstName,
//     this.lastName,
//     this.dob,
//     this.gender,
//     this.language,
//     this.email,
//     this.personalEmail,
//     this.personalMobile,
//     this.personalAltMobile,
//     this.add1,
//     this.add2,
//     this.area,
//     this.city,
//     this.state,
//     this.pincode,
//     this.landmark,
//     this.lat,
//     this.lng,
//     this.identityProofName,
//     this.identityProofFileUrl,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.store,
//     this.vendorProductAssociations,
//     this.foods,
//     this.electronics,
//     this.fashions,
//     this.groceries,
//     this.hardwares,
//     this.healthBeauties,
//     this.homeDecores,
//     this.distanceText,
//     this.distance,
//     this.availableInLocation,
//     this.duration,
//     this.products,
//   });
//
//   factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
//     id: json["id"],
//     verified: json["verified"],
//     approved: json["approved"],
//     fullname: json["fullname"],
//     firstName: json["first_name"],
//     lastName: json["last_name"],
//     dob: json["dob"],
//     gender: json["gender"],
//     language: json["language"],
//     email: json["email"],
//     personalEmail: json["personal_email"],
//     personalMobile: json["personal_mobile"],
//     personalAltMobile: json["personal_alt_mobile"],
//     add1: json["add1"],
//     add2: json["add2"],
//     area: json["area"],
//     city: json["city"],
//     state: json["state"],
//     pincode: json["pincode"],
//     landmark: json["landmark"],
//     lat: json["lat"].toDouble(),
//     lng: json["lng"].toDouble(),
//     identityProofName: json["identity_proof_name"],
//     identityProofFileUrl: json["identity_proof_file_url"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     deletedAt: json["deletedAt"],
//     store: Store.fromJson(json["store"]),
//     vendorProductAssociations: List<VendorProductAssociation>.from(json["vendor_product_associations"].map((x) => VendorProductAssociation.fromJson(x))),
//     foods: List<dynamic>.from(json["foods"].map((x) => x)),
//     electronics: List<dynamic>.from(json["electronics"].map((x) => x)),
//     fashions: List<Product>.from(json["fashions"].map((x) => Product.fromJson(x))),
//     groceries: List<dynamic>.from(json["groceries"].map((x) => x)),
//     hardwares: List<dynamic>.from(json["hardwares"].map((x) => x)),
//     healthBeauties: List<dynamic>.from(json["health_beauties"].map((x) => x)),
//     homeDecores: List<dynamic>.from(json["home_decores"].map((x) => x)),
//     distanceText: json["distance_text"],
//     distance: json["distance"].toDouble(),
//     availableInLocation: json["available_in_location"],
//     duration: json["duration"],
//     products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "verified": verified,
//     "approved": approved,
//     "fullname": fullname,
//     "first_name": firstName,
//     "last_name": lastName,
//     "dob": dob,
//     "gender": gender,
//     "language": language,
//     "email": email,
//     "personal_email": personalEmail,
//     "personal_mobile": personalMobile,
//     "personal_alt_mobile": personalAltMobile,
//     "add1": add1,
//     "add2": add2,
//     "area": area,
//     "city": city,
//     "state": state,
//     "pincode": pincode,
//     "landmark": landmark,
//     "lat": lat,
//     "lng": lng,
//     "identity_proof_name": identityProofName,
//     "identity_proof_file_url": identityProofFileUrl,
//     "createdAt": createdAt!.toIso8601String(),
//     "updatedAt": updatedAt!.toIso8601String(),
//     "deletedAt": deletedAt,
//     "store": store!.toJson(),
//     "vendor_product_associations": List<dynamic>.from(vendorProductAssociations!.map((x) => x.toJson())),
//     "foods": List<dynamic>.from(foods!.map((x) => x)),
//     "electronics": List<dynamic>.from(electronics!.map((x) => x)),
//     "fashions": List<dynamic>.from(fashions!.map((x) => x.toJson())),
//     "groceries": List<dynamic>.from(groceries!.map((x) => x)),
//     "hardwares": List<dynamic>.from(hardwares!.map((x) => x)),
//     "health_beauties": List<dynamic>.from(healthBeauties!.map((x) => x)),
//     "home_decores": List<dynamic>.from(homeDecores!.map((x) => x)),
//     "distance_text": distanceText,
//     "distance": distance,
//     "available_in_location": availableInLocation,
//     "duration": duration,
//     "products": List<dynamic>.from(products!.map((x) => x.toJson())),
//   };
// }
//
// class Store {
//   int? id;
//   bool? approved;
//   String? name;
//   String? gstNumber;
//   String? fssaiNumber;
//   String? mobile;
//   String? altMobile;
//   String? email;
//   String? add1;
//   String? add2;
//   String? area;
//   String? city;
//   String? state;
//   String? pincode;
//   String? landmark;
//   double? lat;
//   double? lng;
//   int? vendorId;
//   int? serviceRadius;
//   String? storeImageUrl;
//   String? typeMarketPlace;
//   bool? isOpen;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic deletedAt;
//
//   Store({
//     this.id,
//     this.approved,
//     this.name,
//     this.gstNumber,
//     this.fssaiNumber,
//     this.mobile,
//     this.altMobile,
//     this.email,
//     this.add1,
//     this.add2,
//     this.area,
//     this.city,
//     this.state,
//     this.pincode,
//     this.landmark,
//     this.lat,
//     this.lng,
//     this.vendorId,
//     this.serviceRadius,
//     this.storeImageUrl,
//     this.typeMarketPlace,
//     this.isOpen,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//
//   factory Store.fromJson(Map<String, dynamic> json) => Store(
//     id: json["id"],
//     approved: json["approved"],
//     name: json["name"],
//     gstNumber: json["gst_number"],
//     fssaiNumber: json["fssai_number"],
//     mobile: json["mobile"],
//     altMobile: json["alt_mobile"],
//     email: json["email"],
//     add1: json["add1"],
//     add2: json["add2"],
//     area: json["area"],
//     city: json["city"],
//     state: json["state"],
//     pincode: json["pincode"],
//     landmark: json["landmark"],
//     lat: json["lat"].toDouble(),
//     lng: json["lng"].toDouble(),
//     vendorId: json["vendor_id"],
//     serviceRadius: json["service_radius"],
//     storeImageUrl: json["store_image_url"],
//     typeMarketPlace: json["type_market_place"],
//     isOpen: json["is_open"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     deletedAt: json["deletedAt"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "approved": approved,
//     "name": name,
//     "gst_number": gstNumber,
//     "fssai_number": fssaiNumber,
//     "mobile": mobile,
//     "alt_mobile": altMobile,
//     "email": email,
//     "add1": add1,
//     "add2": add2,
//     "area": area,
//     "city": city,
//     "state": state,
//     "pincode": pincode,
//     "landmark": landmark,
//     "lat": lat,
//     "lng": lng,
//     "vendor_id": vendorId,
//     "service_radius": serviceRadius,
//     "store_image_url": storeImageUrl,
//     "type_market_place": typeMarketPlace,
//     "is_open": isOpen,
//     "createdAt": createdAt!.toIso8601String(),
//     "updatedAt": updatedAt!.toIso8601String(),
//     "deletedAt": deletedAt,
//   };
// }
//
// class VendorProductAssociation {
//   int? id;
//   int? vendorId;
//   TableName tableName;
//   int? tableId;
//   CategoryName categoryName;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic deletedAt;
//   CategoryTableAssociation? categoryTableAssociation;
//
//   VendorProductAssociation({
//     this.id,
//     this.vendorId,
//     this.tableName,
//     this.tableId,
//     this.categoryName,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.categoryTableAssociation,
//   });
//
//   factory VendorProductAssociation.fromJson(Map<String, dynamic> json) => VendorProductAssociation(
//     id: json["id"],
//     vendorId: json["vendor_id"],
//     tableName: json["table_name"],
//     tableId: json["table_id"],
//     categoryName: json["category_name"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     deletedAt: json["deletedAt"],
//     categoryTableAssociation: CategoryTableAssociation.fromJson(json["category_table_association"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "vendor_id": vendorId,
//     "table_name": tableName,
//     "table_id": tableId,
//     "category_name": categoryName,
//     "createdAt": createdAt!.toIso8601String(),
//     "updatedAt": updatedAt!.toIso8601String(),
//     "deletedAt": deletedAt,
//     "category_table_association": categoryTableAssociation!.toJson(),
//   };
// }
//
// class CategoryTableAssociation {
//   int? id;
//   CategoryName categoryName;
//   TableName tableName;
//   String image;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic deletedAt;
//
//   CategoryTableAssociation({
//     this.id,
//     this.categoryName,
//     this.tableName,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//
//   factory CategoryTableAssociation.fromJson(Map<String, dynamic> json) => CategoryTableAssociation(
//     id: json["id"],
//     categoryName: json["category_name"],
//     tableName: json["table_name"],
//     image: json["image"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     deletedAt: json["deletedAt"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "category_name": categoryName,
//     "table_name": tableName,
//     "image": image,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "deletedAt": deletedAt,
//   };
// }
//
// enum Color {
//   BLACK,
//   RED
// }
//
// class ImagesOfProduct {
//   int id;
//   TableName productTable;
//   int productId;
//   String imageUrl;
//   bool active;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic deletedAt;
//
//   ImagesOfProduct({
//     this.id,
//     this.productTable,
//     required this.productId,
//     this.imageUrl,
//     this.active,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//
//   factory ImagesOfProduct.fromJson(Map<String, dynamic> json) => ImagesOfProduct(
//     id: json["id"],
//     productTable: json["product_table"],
//     productId: json["product_id"],
//     imageUrl: json["image_url"],
//     active: json["active"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     deletedAt: json["deletedAt"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "product_table": productTable,
//     "product_id": productId,
//     "image_url": imageUrl,
//     "active": active,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "deletedAt": deletedAt,
//   };
// }
//
// enum Description {
//   SHIRT,
//   TESTING_PRODUCT
// }
//
// final descriptionValues = EnumValues({
//   "Shirt": Description.SHIRT,
//   "Testing Product": Description.TESTING_PRODUCT
// });
//
// enum Highlight {
//   SHIRT_PRINTED_SHIRT,
//   TESTING_PRODUCT_TESTING_PRODUCT_TESTING_PRODUCT
// }
//
// final highlightValues = EnumValues({
//   "Shirt, Printed Shirt": Highlight.SHIRT_PRINTED_SHIRT,
//   "Testing Product, Testing Product, Testing Product": Highlight.TESTING_PRODUCT_TESTING_PRODUCT_TESTING_PRODUCT
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
