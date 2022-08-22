// To parse this JSON data, do
//
//     final myNotesModel = myNotesModelFromJson(jsonString);

import 'dart:convert';

List<MyNotesModel> myNotesModelFromJson(String str) => List<MyNotesModel>.from(json.decode(str).map((x) => MyNotesModel.fromJson(x)));

String myNotesModelToJson(List<MyNotesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyNotesModel {
    MyNotesModel({
        required this.success,
        required this.id,
        required this.title,
        required this.details,
        required this.userId,
        required this.date,
    });

    bool success;
    String id;
    String title;
    String details;
    String userId;
    DateTime date;

    factory MyNotesModel.fromJson(Map<String, dynamic> json) => MyNotesModel(
        success: json["success"],
        id: json["id"],
        title: json["title"],
        details: json["details"],
        userId: json["user_id"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "id": id,
        "title": title,
        "details": details,
        "user_id": userId,
        "date": date.toIso8601String(),
    };
}
