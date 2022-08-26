// To parse this JSON data, do
//
//     final SoraModel = SoraModelFromJson(jsonString);

import 'dart:convert';

List<SoraModel> SoraModelFromJson(String str) => List<SoraModel>.from(json.decode(str).map((x) => SoraModel.fromJson(x)));

String SoraModelToJson(List<SoraModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SoraModel {
    SoraModel({
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

    factory SoraModel.fromJson(Map<String, dynamic> json) => SoraModel(
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
