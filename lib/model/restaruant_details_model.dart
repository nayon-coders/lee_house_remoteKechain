// To parse this JSON data, do
//
//     final resturentDetails = resturentDetailsFromJson(jsonString);

import 'dart:convert';

ResturentDetails resturentDetailsFromJson(String str) => ResturentDetails.fromJson(json.decode(str));

String resturentDetailsToJson(ResturentDetails data) => json.encode(data.toJson());

class ResturentDetails {
  final int? id;
  final List<dynamic>? openingHours;
  final String? restaurantName;
  final RestaurantDetails? restaurantDetails;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? uid;
  final String? slug;
  final String? name;
  final String? details;
  final bool? directOrder;
  final String? phone;
  final String? email;
  final String? doordashExternalStoreId;
  final int? restaurant;

  ResturentDetails({
    this.id,
    this.openingHours,
    this.restaurantName,
    this.restaurantDetails,
    this.createdDate,
    this.modifiedDate,
    this.uid,
    this.slug,
    this.name,
    this.details,
    this.directOrder,
    this.phone,
    this.email,
    this.doordashExternalStoreId,
    this.restaurant,
  });

  factory ResturentDetails.fromJson(Map<String, dynamic> json) => ResturentDetails(
    id: json["id"],
    openingHours: json["opening_hours"] == null ? [] : List<dynamic>.from(json["opening_hours"]!.map((x) => x)),
    restaurantName: json["restaurant_name"],
    restaurantDetails: json["restaurant_details"] == null ? null : RestaurantDetails.fromJson(json["restaurant_details"]),
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    uid: json["uid"],
    slug: json["slug"],
    name: json["name"],
    details: json["details"],
    directOrder: json["direct_order"],
    phone: json["phone"],
    email: json["email"],
    doordashExternalStoreId: json["doordash_external_store_id"],
    restaurant: json["restaurant"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "opening_hours": openingHours == null ? [] : List<dynamic>.from(openingHours!.map((x) => x)),
    "restaurant_name": restaurantName,
    "restaurant_details": restaurantDetails?.toJson(),
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "uid": uid,
    "slug": slug,
    "name": name,
    "details": details,
    "direct_order": directOrder,
    "phone": phone,
    "email": email,
    "doordash_external_store_id": doordashExternalStoreId,
    "restaurant": restaurant,
  };
}

class RestaurantDetails {
  final int? id;
  final List<dynamic>? openingHours;
  final dynamic avatarImage;
  final dynamic bannerImage;
  final int? locationCnt;
  final int? menuCnt;
  final int? categoryCnt;
  final int? itemCnt;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? uid;
  final String? slug;
  final String? name;
  final String? location;
  final String? phone;
  final String? email;
  final String? doordashExternalStoreId;
  final String? otterXStoreId;
  final dynamic otterClientId;
  final dynamic otterClientSecret;
  final String? otterAuthToken;
  final String? otterXEventId;
  final bool? isStoreClose;
  final bool? isMenuImporting;
  final bool? isMenuImported;
  final String? timezone;
  final int? owner;
  final int? company;
  final int? paymentDetails;

  RestaurantDetails({
    this.id,
    this.openingHours,
    this.avatarImage,
    this.bannerImage,
    this.locationCnt,
    this.menuCnt,
    this.categoryCnt,
    this.itemCnt,
    this.createdDate,
    this.modifiedDate,
    this.uid,
    this.slug,
    this.name,
    this.location,
    this.phone,
    this.email,
    this.doordashExternalStoreId,
    this.otterXStoreId,
    this.otterClientId,
    this.otterClientSecret,
    this.otterAuthToken,
    this.otterXEventId,
    this.isStoreClose,
    this.isMenuImporting,
    this.isMenuImported,
    this.timezone,
    this.owner,
    this.company,
    this.paymentDetails,
  });

  factory RestaurantDetails.fromJson(Map<String, dynamic> json) => RestaurantDetails(
    id: json["id"],
    openingHours: json["opening_hours"] == null ? [] : List<dynamic>.from(json["opening_hours"]!.map((x) => x)),
    avatarImage: json["avatar_image"],
    bannerImage: json["banner_image"],
    locationCnt: json["location_cnt"],
    menuCnt: json["menu_cnt"],
    categoryCnt: json["category_cnt"],
    itemCnt: json["item_cnt"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    uid: json["uid"],
    slug: json["slug"],
    name: json["name"],
    location: json["location"],
    phone: json["phone"],
    email: json["email"],
    doordashExternalStoreId: json["doordash_external_store_id"],
    otterXStoreId: json["otter_x_store_id"],
    otterClientId: json["otter_client_id"],
    otterClientSecret: json["otter_client_secret"],
    otterAuthToken: json["otter_auth_token"],
    otterXEventId: json["otter_x_event_id"],
    isStoreClose: json["is_store_close"],
    isMenuImporting: json["is_menu_importing"],
    isMenuImported: json["is_menu_imported"],
    timezone: json["timezone"],
    owner: json["owner"],
    company: json["company"],
    paymentDetails: json["payment_details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "opening_hours": openingHours == null ? [] : List<dynamic>.from(openingHours!.map((x) => x)),
    "avatar_image": avatarImage,
    "banner_image": bannerImage,
    "location_cnt": locationCnt,
    "menu_cnt": menuCnt,
    "category_cnt": categoryCnt,
    "item_cnt": itemCnt,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "uid": uid,
    "slug": slug,
    "name": name,
    "location": location,
    "phone": phone,
    "email": email,
    "doordash_external_store_id": doordashExternalStoreId,
    "otter_x_store_id": otterXStoreId,
    "otter_client_id": otterClientId,
    "otter_client_secret": otterClientSecret,
    "otter_auth_token": otterAuthToken,
    "otter_x_event_id": otterXEventId,
    "is_store_close": isStoreClose,
    "is_menu_importing": isMenuImporting,
    "is_menu_imported": isMenuImported,
    "timezone": timezone,
    "owner": owner,
    "company": company,
    "payment_details": paymentDetails,
  };
}
