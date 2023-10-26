// To parse this JSON data, do
//
//     final imageFetchModel = imageFetchModelFromJson(jsonString);

import 'dart:convert';

ImageFetchModel imageFetchModelFromJson(String str) => ImageFetchModel.fromJson(json.decode(str));

String imageFetchModelToJson(ImageFetchModel data) => json.encode(data.toJson());

class ImageFetchModel {
  int code;
  String status;
  String message;
  List<Banner> banners;

  ImageFetchModel({
    required this.code,
    required this.status,
    required this.message,
    required this.banners,
  });

  factory ImageFetchModel.fromJson(Map<String, dynamic> json) => ImageFetchModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
  };
}

class Banner {
  int id;
  String webBannerUrl;
  String appBannerUrl;
  int vendorId;
  dynamic storeId;
  int active;
  int approve;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Vendor vendor;
  int showInApp;

  Banner({
    required this.id,
    required this.webBannerUrl,
    required this.appBannerUrl,
    required this.vendorId,
    required this.storeId,
    required this.active,
    required this.approve,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.vendor,
    required this.showInApp,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    webBannerUrl: json["web_banner_url"],
    appBannerUrl: json["app_banner_url"],
    vendorId: json["vendor_id"],
    storeId: json["store_id"],
    active: json["active"],
    approve: json["approve"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    vendor: Vendor.fromJson(json["vendor"]),
    showInApp: json["show_in_app"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "web_banner_url": webBannerUrl,
    "app_banner_url": appBannerUrl,
    "vendor_id": vendorId,
    "store_id": storeId,
    "show_in_app": showInApp,
    "active": active,
    "approve": approve,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "vendor": vendor.toJson(),
  };
}

class Vendor {
  int id;
  int verified;
  int approved;
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
    email: json["email"],
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
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    identityProofName: json["identity_proof_name"],
    identityProofFileUrl: json["identity_proof_file_url"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    store: Store.fromJson(json["store"]),
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
  };
}

class Store {
  int id;
  int approved;
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
  int isOpen;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;

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
    // required this.createdAt,
    // required this.updatedAt,
    // required this.deletedAt,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"] ?? 0,
    approved: json["approved"] ?? 0,
    name: json["name"] ?? "",
    gstNumber: json["gst_number"] ?? "",
    fssaiNumber: json["fssai_number"] ?? "",
    mobile: json["mobile"] ?? "",
    altMobile: json["alt_mobile"] ?? "",
    email: json["email"] ?? "",
    add1: json["add1"] ?? "",
    add2: json["add2"] ?? "",
    area: json["area"] ?? "",
    city: json["city"] ?? "",
    state: json["state"] ?? "",
    pincode: json["pincode"] ?? "",
    landmark: json["landmark"] ?? "",
    lat: json["lat"]?.toDouble() ?? 0.0,
    lng: json["lng"]?.toDouble() ?? 0.0,
    vendorId: json["vendor_id"] ?? 0,
    serviceRadius: json["service_radius"] ?? 0,
    storeImageUrl: json["store_image_url"] ?? "",
    typeMarketPlace: json["type_market_place"] ?? "",
    isOpen: json["is_open"] ?? 0,
    // createdAt: DateTime.parse(json["createdAt"] ?? ""),
    // updatedAt: DateTime.parse(json["updatedAt"]),
    // deletedAt: json["deletedAt"],
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
    // "createdAt": createdAt.toIso8601String(),
    // "updatedAt": updatedAt.toIso8601String(),
    // "deletedAt": deletedAt,
  };
}
