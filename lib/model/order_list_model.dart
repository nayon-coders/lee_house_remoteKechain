// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  final Links? links;
  final int? count;
  final List<OrderListResult>? results;

  OrderListModel({
    this.links,
    this.count,
    this.results,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    count: json["count"],
    results: json["results"] == null ? [] : List<OrderListResult>.from(json["results"]!.map((x) => OrderListResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "links": links?.toJson(),
    "count": count,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Links {
  final String? next;
  final dynamic previous;

  Links({
    this.next,
    this.previous,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: json["next"],
    previous: json["previous"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
    "previous": previous,
  };
}

class OrderListResult {
  final int? id;
  final List<OrderitemSet>? orderitemSet;
  final String? voucher;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final Customer? customer;
  final String? orderId;
  final Status? status;
  final int? quantity;
  final double? subtotal;
  final int? deliveryFee;
  final double? tax;
  final int? convenienceFee;
  final double? discount;
  final double? total;
  final int? tips;
  final Currency? currency;
  final bool? isPaid;
  final DateTime? receiveDate;
  final DateTime? pickupTime;
  final DateTime? deliveryTime;
  final DeliveryPlatform? deliveryPlatform;
  final PickupAddress? pickupAddress;
  final String? dropoffAddress;
  final DropoffLocation? dropoffLocation;
  final String? dropoffPhoneNumber;
  final DropoffContactFirstName? dropoffContactFirstName;
  final DropoffContactLastName? dropoffContactLastName;
  final String? trackingUrl;
  final String? supportReference;
  final String? cancellationReason;
  final OrderMethod? orderMethod;
  final SchedulingType? schedulingType;
  final dynamic scheduledTime;
  final DropoffLocation? extra;
  final OrderType? orderType;
  final int? user;
  final int? company;
  final int? restaurant;
  final int? location;
  final int? purchase;
  final dynamic bogo;
  final dynamic rewardCoupon;
  final dynamic externalPlatform;
  final List<dynamic>? posData;

  OrderListResult({
    this.id,
    this.orderitemSet,
    this.voucher,
    this.createdDate,
    this.modifiedDate,
    this.customer,
    this.orderId,
    this.status,
    this.quantity,
    this.subtotal,
    this.deliveryFee,
    this.tax,
    this.convenienceFee,
    this.discount,
    this.total,
    this.tips,
    this.currency,
    this.isPaid,
    this.receiveDate,
    this.pickupTime,
    this.deliveryTime,
    this.deliveryPlatform,
    this.pickupAddress,
    this.dropoffAddress,
    this.dropoffLocation,
    this.dropoffPhoneNumber,
    this.dropoffContactFirstName,
    this.dropoffContactLastName,
    this.trackingUrl,
    this.supportReference,
    this.cancellationReason,
    this.orderMethod,
    this.schedulingType,
    this.scheduledTime,
    this.extra,
    this.orderType,
    this.user,
    this.company,
    this.restaurant,
    this.location,
    this.purchase,
    this.bogo,
    this.rewardCoupon,
    this.externalPlatform,
    this.posData,
  });

  factory OrderListResult.fromJson(Map<String, dynamic> json) => OrderListResult(
    id: json["id"],
    orderitemSet: json["orderitem_set"] == null ? [] : List<OrderitemSet>.from(json["orderitem_set"]!.map((x) => OrderitemSet.fromJson(x))),
    voucher: json["voucher"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    customer: customerValues.map[json["customer"]]!,
    orderId: json["order_id"],
    status: statusValues.map[json["status"]]!,
    quantity: json["quantity"],
    subtotal: json["subtotal"]?.toDouble(),
    deliveryFee: json["delivery_fee"],
    tax: json["tax"]?.toDouble(),
    convenienceFee: json["convenience_fee"],
    discount: json["discount"]?.toDouble(),
    total: json["total"]?.toDouble(),
    tips: json["tips"],
    currency: currencyValues.map[json["currency"]]!,
    isPaid: json["is_paid"],
    receiveDate: json["receive_date"] == null ? null : DateTime.parse(json["receive_date"]),
    pickupTime: json["pickup_time"] == null ? null : DateTime.parse(json["pickup_time"]),
    deliveryTime: json["delivery_time"] == null ? null : DateTime.parse(json["delivery_time"]),
    deliveryPlatform: deliveryPlatformValues.map[json["delivery_platform"]]!,
    pickupAddress: pickupAddressValues.map[json["pickup_address"]]!,
    dropoffAddress: json["dropoff_address"],
    dropoffLocation: json["dropoff_location"] == null ? null : DropoffLocation.fromJson(json["dropoff_location"]),
    dropoffPhoneNumber: json["dropoff_phone_number"],
    dropoffContactFirstName: dropoffContactFirstNameValues.map[json["dropoff_contact_first_name"]]!,
    dropoffContactLastName: dropoffContactLastNameValues.map[json["dropoff_contact_last_name"]]!,
    trackingUrl: json["tracking_url"],
    supportReference: json["support_reference"],
    cancellationReason: json["cancellation_reason"],
    orderMethod: orderMethodValues.map[json["order_method"]]!,
    schedulingType: schedulingTypeValues.map[json["scheduling_type"]]!,
    scheduledTime: json["scheduled_time"],
    extra: json["extra"] == null ? null : DropoffLocation.fromJson(json["extra"]),
    orderType: orderTypeValues.map[json["order_type"]]!,
    user: json["user"],
    company: json["company"],
    restaurant: json["restaurant"],
    location: json["location"],
    purchase: json["purchase"],
    bogo: json["bogo"],
    rewardCoupon: json["reward_coupon"],
    externalPlatform: json["external_platform"],
    posData: json["pos_data"] == null ? [] : List<dynamic>.from(json["pos_data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderitem_set": orderitemSet == null ? [] : List<dynamic>.from(orderitemSet!.map((x) => x.toJson())),
    "voucher": voucher,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "customer": customerValues.reverse[customer],
    "order_id": orderId,
    "status": statusValues.reverse[status],
    "quantity": quantity,
    "subtotal": subtotal,
    "delivery_fee": deliveryFee,
    "tax": tax,
    "convenience_fee": convenienceFee,
    "discount": discount,
    "total": total,
    "tips": tips,
    "currency": currencyValues.reverse[currency],
    "is_paid": isPaid,
    "receive_date": receiveDate?.toIso8601String(),
    "pickup_time": pickupTime?.toIso8601String(),
    "delivery_time": deliveryTime?.toIso8601String(),
    "delivery_platform": deliveryPlatformValues.reverse[deliveryPlatform],
    "pickup_address": pickupAddressValues.reverse[pickupAddress],
    "dropoff_address": dropoffAddress,
    "dropoff_location": dropoffLocation?.toJson(),
    "dropoff_phone_number": dropoffPhoneNumber,
    "dropoff_contact_first_name": dropoffContactFirstNameValues.reverse[dropoffContactFirstName],
    "dropoff_contact_last_name": dropoffContactLastNameValues.reverse[dropoffContactLastName],
    "tracking_url": trackingUrl,
    "support_reference": supportReference,
    "cancellation_reason": cancellationReason,
    "order_method": orderMethodValues.reverse[orderMethod],
    "scheduling_type": schedulingTypeValues.reverse[schedulingType],
    "scheduled_time": scheduledTime,
    "extra": extra?.toJson(),
    "order_type": orderTypeValues.reverse[orderType],
    "user": user,
    "company": company,
    "restaurant": restaurant,
    "location": location,
    "purchase": purchase,
    "bogo": bogo,
    "reward_coupon": rewardCoupon,
    "external_platform": externalPlatform,
    "pos_data": posData == null ? [] : List<dynamic>.from(posData!.map((x) => x)),
  };
}

enum Currency {
  USD
}

final currencyValues = EnumValues({
  "usd": Currency.USD
});

enum Customer {
  SOUMIK_ROY
}

final customerValues = EnumValues({
  "Soumik Roy": Customer.SOUMIK_ROY
});

enum DeliveryPlatform {
  DOORDASH
}

final deliveryPlatformValues = EnumValues({
  "doordash": DeliveryPlatform.DOORDASH
});

enum DropoffContactFirstName {
  SOUMIK
}

final dropoffContactFirstNameValues = EnumValues({
  "Soumik": DropoffContactFirstName.SOUMIK
});

enum DropoffContactLastName {
  ROY
}

final dropoffContactLastNameValues = EnumValues({
  "Roy": DropoffContactLastName.ROY
});

class DropoffLocation {
  DropoffLocation();

  factory DropoffLocation.fromJson(Map<String, dynamic> json) => DropoffLocation(
  );

  Map<String, dynamic> toJson() => {
  };
}

enum OrderMethod {
  DELIVERY,
  PICKUP
}

final orderMethodValues = EnumValues({
  "delivery": OrderMethod.DELIVERY,
  "pickup": OrderMethod.PICKUP
});

enum OrderType {
  INTERNAL
}

final orderTypeValues = EnumValues({
  "internal": OrderType.INTERNAL
});

class OrderitemSet {
  final int? id;
  final ItemName? itemName;
  final List<dynamic>? modifiers;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final int? quantity;
  final int? order;
  final int? menuItem;

  OrderitemSet({
    this.id,
    this.itemName,
    this.modifiers,
    this.createdDate,
    this.modifiedDate,
    this.quantity,
    this.order,
    this.menuItem,
  });

  factory OrderitemSet.fromJson(Map<String, dynamic> json) => OrderitemSet(
    id: json["id"],
    itemName: itemNameValues.map[json["item_name"]]!,
    modifiers: json["modifiers"] == null ? [] : List<dynamic>.from(json["modifiers"]!.map((x) => x)),
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    quantity: json["quantity"],
    order: json["order"],
    menuItem: json["menu_item"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "item_name": itemNameValues.reverse[itemName],
    "modifiers": modifiers == null ? [] : List<dynamic>.from(modifiers!.map((x) => x)),
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "quantity": quantity,
    "order": order,
    "menu_item": menuItem,
  };
}

enum ItemName {
  CHOPPED_SALAD_SHIRAZI,
  YELLOW_SPLIT_PEA_STEW
}

final itemNameValues = EnumValues({
  "Chopped Salad(Shirazi)": ItemName.CHOPPED_SALAD_SHIRAZI,
  "Yellow split pea stew": ItemName.YELLOW_SPLIT_PEA_STEW
});

enum PickupAddress {
  THE_3994_SHELBOURNE_ST_103_B_VICTORIA_BC_V8_N_3_E2_CANADA
}

final pickupAddressValues = EnumValues({
  "3994 Shelbourne St #103b, Victoria, BC V8N 3E2, Canada": PickupAddress.THE_3994_SHELBOURNE_ST_103_B_VICTORIA_BC_V8_N_3_E2_CANADA
});

enum SchedulingType {
  ASAP
}

final schedulingTypeValues = EnumValues({
  "asap": SchedulingType.ASAP
});

enum Status {
  CANCELLED,
  PENDING
}

final statusValues = EnumValues({
  "cancelled": Status.CANCELLED,
  "pending": Status.PENDING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
