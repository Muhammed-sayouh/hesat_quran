// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) => List<CategoriesModel>.from(json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
    CategoriesModel({
        required this.success,
        required this.id,
        required this.name,
    });

    bool success;
    String id;
    String name;

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        success: json["success"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "id": id,
        "name": name,
    };
}
