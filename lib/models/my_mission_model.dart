// To parse this JSON data, do
//
//     final myMissionsModel = myMissionsModelFromJson(jsonString);

import 'dart:convert';

List<MyMissionsModel> myMissionsModelFromJson(String str) => List<MyMissionsModel>.from(json.decode(str).map((x) => MyMissionsModel.fromJson(x)));

String myMissionsModelToJson(List<MyMissionsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyMissionsModel {
    MyMissionsModel({
        required this.success,
        required this.id,
        required this.title,
        required this.details,
        required this.date,
        required this.time,
        required this.userId,
    });

    bool success;
    String id;
    String title;
    String details;
    String date;
    String time;
    String userId;

    factory MyMissionsModel.fromJson(Map<String, dynamic> json) => MyMissionsModel(
        success: json["success"],
        id: json["id"],
        title: json["title"],
        details: json["details"],
        date: json["date"],
        time: json["time"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "id": id,
        "title": title,
        "details": details,
        "date": date,
        "time": time,
        "user_id": userId,
    };
}
