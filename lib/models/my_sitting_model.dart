// To parse this JSON data, do
//
//     final mySittingModel = mySittingModelFromJson(jsonString);

import 'dart:convert';

List<MySittingModel> mySittingModelFromJson(String str) => List<MySittingModel>.from(json.decode(str).map((x) => MySittingModel.fromJson(x)));

String mySittingModelToJson(List<MySittingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MySittingModel {
    MySittingModel({
        required this.id,
        required this.name,
        required this.description,
    });

    String id;
    String name;
    String description;

    factory MySittingModel.fromJson(Map<String, dynamic> json) => MySittingModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
    };
}
