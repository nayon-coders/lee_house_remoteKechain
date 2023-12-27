// To parse this JSON data, do
//
//     final stateController = stateControllerFromJson(jsonString);

import 'dart:convert';

List<StateModel> stateControllerFromJson(String str) => List<StateModel>.from(json.decode(str).map((x) => StateModel.fromJson(x)));

String stateControllerToJson(List<StateModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateModel {
  final int? id;
  final String? name;
  final String? iso2;

  StateModel({
    this.id,
    this.name,
    this.iso2,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
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
