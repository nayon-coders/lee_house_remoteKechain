// To parse this JSON data, do
//
//     final quoteCreateModel = quoteCreateModelFromJson(jsonString);

import 'dart:convert';

QuoteCreateModel quoteCreateModelFromJson(String str) => QuoteCreateModel.fromJson(json.decode(str));

String quoteCreateModelToJson(QuoteCreateModel data) => json.encode(data.toJson());

class QuoteCreateModel {
  final String? externalDeliveryId;
  final String? currency;
  final String? deliveryStatus;
  final double? fee;
  final String? pickupAddress;
  final String? pickupBusinessName;
  final String? pickupPhoneNumber;
  final String? pickupExternalBusinessId;
  final String? pickupExternalStoreId;
  final String? dropoffAddress;
  final DropoffLocation? dropoffLocation;
  final String? dropoffPhoneNumber;
  final String? dropoffContactGivenName;
  final String? dropoffContactFamilyName;
  final DropoffOptions? dropoffOptions;
  final int? orderValue;
  final List<Item>? items;
  final DateTime? updatedAt;
  final DateTime? pickupTimeEstimated;
  final DateTime? dropoffTimeEstimated;
  final List<dynamic>? feeComponents;
  final int? tax;
  final List<TaxComponent>? taxComponents;
  final String? trackingUrl;
  final bool? contactlessDropoff;
  final String? actionIfUndeliverable;
  final int? tip;
  final OrderContains? orderContains;
  final bool? dropoffRequiresSignature;
  final int? dropoffCashOnDelivery;
  final Costs? costs;

  QuoteCreateModel({
    this.externalDeliveryId,
    this.currency,
    this.deliveryStatus,
    this.fee,
    this.pickupAddress,
    this.pickupBusinessName,
    this.pickupPhoneNumber,
    this.pickupExternalBusinessId,
    this.pickupExternalStoreId,
    this.dropoffAddress,
    this.dropoffLocation,
    this.dropoffPhoneNumber,
    this.dropoffContactGivenName,
    this.dropoffContactFamilyName,
    this.dropoffOptions,
    this.orderValue,
    this.items,
    this.updatedAt,
    this.pickupTimeEstimated,
    this.dropoffTimeEstimated,
    this.feeComponents,
    this.tax,
    this.taxComponents,
    this.trackingUrl,
    this.contactlessDropoff,
    this.actionIfUndeliverable,
    this.tip,
    this.orderContains,
    this.dropoffRequiresSignature,
    this.dropoffCashOnDelivery,
    this.costs,
  });

  factory QuoteCreateModel.fromJson(Map<String, dynamic> json) => QuoteCreateModel(
    externalDeliveryId: json["external_delivery_id"],
    currency: json["currency"],
    deliveryStatus: json["delivery_status"],
    fee: json["fee"],
    pickupAddress: json["pickup_address"],
    pickupBusinessName: json["pickup_business_name"],
    pickupPhoneNumber: json["pickup_phone_number"],
    pickupExternalBusinessId: json["pickup_external_business_id"],
    pickupExternalStoreId: json["pickup_external_store_id"],
    dropoffAddress: json["dropoff_address"],
    dropoffLocation: json["dropoff_location"] == null ? null : DropoffLocation.fromJson(json["dropoff_location"]),
    dropoffPhoneNumber: json["dropoff_phone_number"],
    dropoffContactGivenName: json["dropoff_contact_given_name"],
    dropoffContactFamilyName: json["dropoff_contact_family_name"],
    dropoffOptions: json["dropoff_options"] == null ? null : DropoffOptions.fromJson(json["dropoff_options"]),
    orderValue: json["order_value"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pickupTimeEstimated: json["pickup_time_estimated"] == null ? null : DateTime.parse(json["pickup_time_estimated"]),
    dropoffTimeEstimated: json["dropoff_time_estimated"] == null ? null : DateTime.parse(json["dropoff_time_estimated"]),
    feeComponents: json["fee_components"] == null ? [] : List<dynamic>.from(json["fee_components"]!.map((x) => x)),
    tax: json["tax"],
    taxComponents: json["tax_components"] == null ? [] : List<TaxComponent>.from(json["tax_components"]!.map((x) => TaxComponent.fromJson(x))),
    trackingUrl: json["tracking_url"],
    contactlessDropoff: json["contactless_dropoff"],
    actionIfUndeliverable: json["action_if_undeliverable"],
    tip: json["tip"],
    orderContains: json["order_contains"] == null ? null : OrderContains.fromJson(json["order_contains"]),
    dropoffRequiresSignature: json["dropoff_requires_signature"],
    dropoffCashOnDelivery: json["dropoff_cash_on_delivery"],
    costs: json["costs"] == null ? null : Costs.fromJson(json["costs"]),
  );

  Map<String, dynamic> toJson() => {
    "external_delivery_id": externalDeliveryId,
    "currency": currency,
    "delivery_status": deliveryStatus,
    "fee": fee,
    "pickup_address": pickupAddress,
    "pickup_business_name": pickupBusinessName,
    "pickup_phone_number": pickupPhoneNumber,
    "pickup_external_business_id": pickupExternalBusinessId,
    "pickup_external_store_id": pickupExternalStoreId,
    "dropoff_address": dropoffAddress,
    "dropoff_location": dropoffLocation?.toJson(),
    "dropoff_phone_number": dropoffPhoneNumber,
    "dropoff_contact_given_name": dropoffContactGivenName,
    "dropoff_contact_family_name": dropoffContactFamilyName,
    "dropoff_options": dropoffOptions?.toJson(),
    "order_value": orderValue,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "updated_at": updatedAt?.toIso8601String(),
    "pickup_time_estimated": pickupTimeEstimated?.toIso8601String(),
    "dropoff_time_estimated": dropoffTimeEstimated?.toIso8601String(),
    "fee_components": feeComponents == null ? [] : List<dynamic>.from(feeComponents!.map((x) => x)),
    "tax": tax,
    "tax_components": taxComponents == null ? [] : List<dynamic>.from(taxComponents!.map((x) => x.toJson())),
    "tracking_url": trackingUrl,
    "contactless_dropoff": contactlessDropoff,
    "action_if_undeliverable": actionIfUndeliverable,
    "tip": tip,
    "order_contains": orderContains?.toJson(),
    "dropoff_requires_signature": dropoffRequiresSignature,
    "dropoff_cash_on_delivery": dropoffCashOnDelivery,
    "costs": costs?.toJson(),
  };
}

class Costs {
  final double? total;
  final double? originalOrderValue;
  final double? orderValue;
  final double? tax;
  final double? deliveryFee;
  final double? convenienceFee;
  final double? discount;
  final double? voucherDiscount;
  final int? quantity;
  final List<OrderList>? orderList;

  Costs({
    this.total,
    this.originalOrderValue,
    this.orderValue,
    this.tax,
    this.deliveryFee,
    this.convenienceFee,
    this.discount,
    this.voucherDiscount,
    this.quantity,
    this.orderList,
  });

  factory Costs.fromJson(Map<String, dynamic> json) => Costs(
    total: json["total"]?.toDouble(),
    originalOrderValue: json["original_order_value"]?.toDouble(),
    orderValue: json["order_value"]?.toDouble(),
    tax: json["tax"]?.toDouble(),
    deliveryFee: json["delivery_fee"],
    convenienceFee: json["convenience_fee"],
    discount: json["discount"],
    voucherDiscount: json["voucher_discount"],
    quantity: json["quantity"],
    orderList: json["order_list"] == null ? [] : List<OrderList>.from(json["order_list"]!.map((x) => OrderList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "original_order_value": originalOrderValue,
    "order_value": orderValue,
    "tax": tax,
    "delivery_fee": deliveryFee,
    "convenience_fee": convenienceFee,
    "discount": discount,
    "voucher_discount": voucherDiscount,
    "quantity": quantity,
    "order_list": orderList == null ? [] : List<dynamic>.from(orderList!.map((x) => x.toJson())),
  };
}

class OrderList {
  final String? itemName;
  final List<dynamic>? modifiers;
  final int? quantity;
  final int? menuItem;

  OrderList({
    this.itemName,
    this.modifiers,
    this.quantity,
    this.menuItem,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    itemName: json["item_name"],
    modifiers: json["modifiers"] == null ? [] : List<dynamic>.from(json["modifiers"]!.map((x) => x)),
    quantity: json["quantity"],
    menuItem: json["menu_item"],
  );

  Map<String, dynamic> toJson() => {
    "item_name": itemName,
    "modifiers": modifiers == null ? [] : List<dynamic>.from(modifiers!.map((x) => x)),
    "quantity": quantity,
    "menu_item": menuItem,
  };
}

class DropoffLocation {
  final double? lat;
  final double? lng;

  DropoffLocation({
    this.lat,
    this.lng,
  });

  factory DropoffLocation.fromJson(Map<String, dynamic> json) => DropoffLocation(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class DropoffOptions {
  final String? signature;
  final String? idVerification;
  final String? proofOfDelivery;

  DropoffOptions({
    this.signature,
    this.idVerification,
    this.proofOfDelivery,
  });

  factory DropoffOptions.fromJson(Map<String, dynamic> json) => DropoffOptions(
    signature: json["signature"],
    idVerification: json["id_verification"],
    proofOfDelivery: json["proof_of_delivery"],
  );

  Map<String, dynamic> toJson() => {
    "signature": signature,
    "id_verification": idVerification,
    "proof_of_delivery": proofOfDelivery,
  };
}

class Item {
  final String? name;
  final int? quantity;
  final String? description;
  final String? externalId;
  final int? price;

  Item({
    this.name,
    this.quantity,
    this.description,
    this.externalId,
    this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    quantity: json["quantity"],
    description: json["description"],
    externalId: json["external_id"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
    "description": description,
    "external_id": externalId,
    "price": price,
  };
}

class OrderContains {
  final bool? alcohol;
  final bool? pharmacyItems;
  final bool? ageRestrictedPharmacyItems;

  OrderContains({
    this.alcohol,
    this.pharmacyItems,
    this.ageRestrictedPharmacyItems,
  });

  factory OrderContains.fromJson(Map<String, dynamic> json) => OrderContains(
    alcohol: json["alcohol"],
    pharmacyItems: json["pharmacy_items"],
    ageRestrictedPharmacyItems: json["age_restricted_pharmacy_items"],
  );

  Map<String, dynamic> toJson() => {
    "alcohol": alcohol,
    "pharmacy_items": pharmacyItems,
    "age_restricted_pharmacy_items": ageRestrictedPharmacyItems,
  };
}

class TaxComponent {
  final String? type;
  final int? amount;

  TaxComponent({
    this.type,
    this.amount,
  });

  factory TaxComponent.fromJson(Map<String, dynamic> json) => TaxComponent(
    type: json["type"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "amount": amount,
  };
}
