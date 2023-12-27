// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  final int? id;
  final String? name;
  final String? iso2;

  CountryModel({
    this.id,
    this.name,
    this.iso2,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    id: json["id"],
    name: json["name"],
    iso2: json["iso2"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "iso2": iso2,
  };
}
