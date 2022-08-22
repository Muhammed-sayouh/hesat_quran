import 'package:flutter/material.dart';

import 'package:dio/dio.dart' as my_dio;
import '../helpers/constants.dart';
import '../helpers/dio/dio.dart';
import '../helpers/exption.dart';

class DeleteMissionService with ChangeNotifier {
  bool doneDeletemission = false;

  Future<bool> deleteMission({
    required String id,
  }) async {
    Map<String, dynamic> map = {"id": id};
    print(map);
    try {
      await dio().post(
        'deletemission.php',
        data: my_dio.FormData.fromMap(map),
      );

      doneDeletemission = true;

      notifyListeners();
      return doneDeletemission;
    } catch (error) {
      rethrow;
    }
  }
}
