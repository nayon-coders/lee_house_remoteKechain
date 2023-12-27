// To parse this JSON data, do
//
//     final couponsListModel = couponsListModelFromJson(jsonString);

import 'dart:convert';

CouponsListModel couponsListModelFromJson(String str) => CouponsListModel.fromJson(json.decode(str));

String couponsListModelToJson(CouponsListModel data) => json.encode(data.toJson());

class CouponsListModel {
  final Links? links;
  final int? count;
  final List<Result>? results;

  CouponsListModel({
    this.links,
    this.count,
    this.results,
  });

  factory CouponsListModel.fromJson(Map<String, dynamic> json) => CouponsListModel(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    count: json["count"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
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

class Result {
  final int? id;
  final List<Duration>? durations;
  final int? company;
  final String? restaurantName;
  final String? locationName;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? name;
  final String? audience;
  final double? amount;
  final double? minimumSpend;
  final double? maxRedeemValue;
  final String? voucherCode;
  final int? restaurant;
  final int? location;

  Result({
    this.id,
    this.durations,
    this.company,
    this.restaurantName,
    this.locationName,
    this.createdDate,
    this.modifiedDate,
    this.name,
    this.audience,
    this.amount,
    this.minimumSpend,
    this.maxRedeemValue,
    this.voucherCode,
    this.restaurant,
    this.location,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    durations: json["durations"] == null ? [] : List<Duration>.from(json["durations"]!.map((x) => Duration.fromJson(x))),
    company: json["company"],
    restaurantName: json["restaurant_name"],
    locationName: json["location_name"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    name: json["name"],
    audience: json["audience"],
    amount: json["amount"],
    minimumSpend: json["minimum_spend"],
    maxRedeemValue: json["max_redeem_value"],
    voucherCode: json["voucher_code"],
    restaurant: json["restaurant"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "durations": durations == null ? [] : List<dynamic>.from(durations!.map((x) => x.toJson())),
    "company": company,
    "restaurant_name": restaurantName,
    "location_name": locationName,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "name": name,
    "audience": audience,
    "amount": amount,
    "minimum_spend": minimumSpend,
    "max_redeem_value": maxRedeemValue,
    "voucher_code": voucherCode,
    "restaurant": restaurant,
    "location": location,
  };
}

class Duration {
  final int? id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final DateTime? startDate;
  final DateTime? endDate;

  Duration({
    this.id,
    this.createdDate,
    this.modifiedDate,
    this.startDate,
    this.endDate,
  });

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
    id: json["id"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "start_date": startDate?.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
  };
}
