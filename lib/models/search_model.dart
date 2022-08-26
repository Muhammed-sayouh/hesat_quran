// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
    SearchModel({
        required this.success,
        required this.id,
        required this.name,
        required this.page,
        required this.sound,
        required this.souraRead,
        required this.souraListen,
    });

    bool success;
    String id;
    String name;
    String page;
    String sound;
    String souraRead;
    String souraListen;

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        success: json["success"],
        id: json["id"],
        name: json["name"],
        page: json["page"],
        sound: json["sound"],
        souraRead: json["soura_read"],
        souraListen: json["soura_listen"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "id": id,
        "name": name,
        "page": page,
        "sound": sound,
        "soura_read": souraRead,
        "soura_listen": souraListen,
    };
}
