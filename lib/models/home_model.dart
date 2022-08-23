// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) => List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
    HomeModel({
        required this.success,
        required this.id,
        required this.name,
        required this.page,
        required this.sound,
        required this.pagesNum,
        required this.ayatNum,
        required this.numRead,
        required this.numListen,
    });

    bool success;
    String id;
    String name;
    String page;
    String sound;
    String pagesNum;
    String ayatNum;
    String numRead;
    String numListen;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        success: json["success"],
        id: json["id"],
        name: json["name"],
        page: json["page"],
        sound: json["sound"],
        pagesNum: json["pages_num"],
        ayatNum: json["ayat_num"],
        numRead: json["num_read"],
        numListen: json["num_listen"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "id": id,
        "name": name,
        "page": page,
        "sound": sound,
        "pages_num": pagesNum,
        "ayat_num": ayatNum,
        "num_read": numRead,
        "num_listen": numListen,
    };
}
