import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as my_dio;
import 'package:hesat_quran/helpers/constants.dart';

import '../helpers/dio/dio.dart';
import '../helpers/exption.dart';
import '../helpers/get_device_id.dart';

class AddNoteService with ChangeNotifier {
  bool doneAddNote = false;

  Future<bool> addNote({required String title, required String details}) async {
    final String? id = await getId();
    Map<String, dynamic> map = {
      'title': title,
      "details": details,
      "user_id": id.toString()
    };
    print(map);
    try {
      my_dio.Response response = await dio().post(
        'addnote.php',
        data: my_dio.FormData.fromMap(map),
      );
      
      
      if (response.data[0]['flag'] != 1) {
        HttpExeption(Constants.noInternet);
        doneAddNote = false;
      }
      if (response.data[0]['flag'] == 1) {
        doneAddNote = true;
      }

      notifyListeners();
      return doneAddNote;
    } catch (error) {
      rethrow;
    }
  }
}
