import 'package:flutter/material.dart';

import 'package:dio/dio.dart' as my_dio;
import '../helpers/constants.dart';
import '../helpers/dio/dio.dart';
import '../helpers/get_device_id.dart';

class SaveSoraService with ChangeNotifier {
  bool doneSave = false;

  Future<bool> saveSoraSer({
    required String soraId,
    required String page,
  }) async {
    Map<String, dynamic> map = {
      "soura_id": soraId,
      "page": page,
      "user_id": await getId()
    };
    print(map);
    try {
      await dio().post(
        'savesoura.php',
        data: my_dio.FormData.fromMap(map),
      );

      doneSave = true;

      notifyListeners();
      return doneSave;
    } catch (error) {
      rethrow;
    }
  }
}
