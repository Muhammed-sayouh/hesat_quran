import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as my_dio;

import '../helpers/dio/dio.dart';
import '../helpers/get_device_id.dart';

class AddMissionService with ChangeNotifier {
  bool doneAddMission = false;

  Future<bool> addMission({required String title, required String details,required String time, required String date}) async {
    final String? id = await getId();
    Map<String, dynamic> map = {
      'title': title,
      "details": details,
      "user_id": id.toString(),
      "date":date,
      "time":time,
    };
    print(map);
    try {
      my_dio.Response response = await dio().post(
        'addmission.php',
        data: my_dio.FormData.fromMap(map),
      );

      doneAddMission = true;

      notifyListeners();
      return doneAddMission;
    } catch (error) {
      rethrow;
    }
  }
}
