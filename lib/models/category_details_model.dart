// To parse this JSON data, do
//
//     final categoriesDetailsModelModel = categoriesDetailsModelModelFromJson(jsonString);

import 'dart:convert';

CategoriesDetailsModelModel categoriesDetailsModelModelFromJson(String str) => CategoriesDetailsModelModel.fromJson(json.decode(str));

String categoriesDetailsModelModelToJson(CategoriesDetailsModelModel data) => json.encode(data.toJson());

class CategoriesDetailsModelModel {
    CategoriesDetailsModelModel({
        required this.success,
        required this.id,
        required this.catId,
        required this.souraId,
        required this.details,
        required this.date,
    });

    bool success;
    String id;
    String catId;
    String souraId;
    String details;
    DateTime date;

    factory CategoriesDetailsModelModel.fromJson(Map<String, dynamic> json) => CategoriesDetailsModelModel(
        success: json["success"],
        id: json["id"],
        catId: json["cat_id"],
        souraId: json["soura_id"],
        details: json["details"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "id": id,
        "cat_id": catId,
        "soura_id": souraId,
        "details": details,
        "date": date.toIso8601String(),
    };
}
