// To parse this JSON data, do
//
//     final mySavesModel = mySavesModelFromJson(jsonString);

import 'dart:convert';

List<MySavesModel> mySavesModelFromJson(String str) => List<MySavesModel>.from(json.decode(str).map((x) => MySavesModel.fromJson(x)));

String mySavesModelToJson(List<MySavesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MySavesModel {
    MySavesModel({
        required this.success,
        required this.id,
        required this.souraId,
        required this.souraName,
        required this.page,
        required this.userId,
        required this.date,
    });

    bool success;
    String id;
    String souraId;
    String souraName;
    String page;
    String userId;
    DateTime date;

    factory MySavesModel.fromJson(Map<String, dynamic> json) => MySavesModel(
        success: json["success"],
        id: json["id"],
        souraId: json["soura_id"],
        souraName: json["soura_name"],
        page: json["page"],
        userId: json["user_id"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "id": id,
        "soura_id": souraId,
        "soura_name": souraName,
        "page": page,
        "user_id": userId,
        "date": date.toIso8601String(),
    };
}
