// To parse this JSON data, do
//
//     final readersModel = readersModelFromJson(jsonString);

import 'dart:convert';

List<ReadersModel> readersModelFromJson(String str) => List<ReadersModel>.from(
    json.decode(str).map((x) => ReadersModel.fromJson(x)));

String readersModelToJson(List<ReadersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReadersModel {
  ReadersModel({
    required this.success,
    required this.id,
    required this.name,
    required this.image,
    required this.folder,
  });

  bool success;
  String id;
  String name;
  String image;
  String folder;

  factory ReadersModel.fromJson(Map<String, dynamic> json) => ReadersModel(
        success: json["success"],
        id: json["id"],
        name: json["name"],
        image: json["image"],
        folder: json["folder"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "id": id,
        "name": name,
        "image": image,
        "folder": folder,
      };
}
