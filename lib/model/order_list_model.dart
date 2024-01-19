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
  final dynamic next;
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
  final dynamic voucher;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? customer;
  final String? orderId;
  final String? status;
  final int? quantity;
  final double? subtotal;
  final double? deliveryFee;
  final double? tax;
  final double? convenienceFee;
  final double? discount;
  final double? total;
  final double? tips;
  final String? currency;
  final bool? isPaid;
  final DateTime? receiveDate;
  final dynamic pickupTime;
  final dynamic deliveryTime;
  final String? deliveryPlatform;
  final String? pickupAddress;
  final String? dropoffAddress;
  final DropoffLocation? dropoffLocation;
  final String? dropoffPhoneNumber;
  final String? dropoffContactFirstName;
  final String? dropoffContactLastName;
  final String? trackingUrl;
  final String? supportReference;
  final String? cancellationReason;
  final String? orderMethod;
  final String? schedulingType;
  final dynamic scheduledTime;
  final DropoffLocation? extra;
  final String? orderType;
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
    customer: json["customer"],
    orderId: json["order_id"],
    status: json["status"],
    quantity: json["quantity"],
    subtotal: json["subtotal"]?.toDouble(),
    deliveryFee: json["delivery_fee"]?.toDouble(),
    tax: json["tax"],
    convenienceFee: json["convenience_fee"],
    discount: json["discount"],
    total: json["total"]?.toDouble(),
    tips: json["tips"],
    currency: json["currency"],
    isPaid: json["is_paid"],
    receiveDate: json["receive_date"] == null ? null : DateTime.parse(json["receive_date"]),
    pickupTime: json["pickup_time"],
    deliveryTime: json["delivery_time"],
    deliveryPlatform: json["delivery_platform"],
    pickupAddress: json["pickup_address"],
    dropoffAddress: json["dropoff_address"],
    dropoffLocation: json["dropoff_location"] == null ? null : DropoffLocation.fromJson(json["dropoff_location"]),
    dropoffPhoneNumber: json["dropoff_phone_number"],
    dropoffContactFirstName: json["dropoff_contact_first_name"],
    dropoffContactLastName: json["dropoff_contact_last_name"],
    trackingUrl: json["tracking_url"],
    supportReference: json["support_reference"],
    cancellationReason: json["cancellation_reason"],
    orderMethod: json["order_method"],
    schedulingType: json["scheduling_type"],
    scheduledTime: json["scheduled_time"],
    extra: json["extra"] == null ? null : DropoffLocation.fromJson(json["extra"]),
    orderType: json["order_type"],
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
    "customer": customer,
    "order_id": orderId,
    "status": status,
    "quantity": quantity,
    "subtotal": subtotal,
    "delivery_fee": deliveryFee,
    "tax": tax,
    "convenience_fee": convenienceFee,
    "discount": discount,
    "total": total,
    "tips": tips,
    "currency": currency,
    "is_paid": isPaid,
    "receive_date": receiveDate?.toIso8601String(),
    "pickup_time": pickupTime,
    "delivery_time": deliveryTime,
    "delivery_platform": deliveryPlatform,
    "pickup_address": pickupAddress,
    "dropoff_address": dropoffAddress,
    "dropoff_location": dropoffLocation?.toJson(),
    "dropoff_phone_number": dropoffPhoneNumber,
    "dropoff_contact_first_name": dropoffContactFirstName,
    "dropoff_contact_last_name": dropoffContactLastName,
    "tracking_url": trackingUrl,
    "support_reference": supportReference,
    "cancellation_reason": cancellationReason,
    "order_method": orderMethod,
    "scheduling_type": schedulingType,
    "scheduled_time": scheduledTime,
    "extra": extra?.toJson(),
    "order_type": orderType,
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

class DropoffLocation {
  DropoffLocation();

  factory DropoffLocation.fromJson(Map<String, dynamic> json) => DropoffLocation(
  );

  Map<String, dynamic> toJson() => {
  };
}

class OrderitemSet {
  final int? id;
  final String? itemName;
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
    itemName: json["item_name"],
    modifiers: json["modifiers"] == null ? [] : List<dynamic>.from(json["modifiers"]!.map((x) => x)),
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    quantity: json["quantity"],
    order: json["order"],
    menuItem: json["menu_item"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "item_name": itemName,
    "modifiers": modifiers == null ? [] : List<dynamic>.from(modifiers!.map((x) => x)),
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "quantity": quantity,
    "order": order,
    "menu_item": menuItem,
  };
}
