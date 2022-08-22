import 'package:flutter/material.dart';

import 'package:dio/dio.dart' as my_dio;
import '../helpers/constants.dart';
import '../helpers/dio/dio.dart';
import '../helpers/exption.dart';

class DeleteNoteService with ChangeNotifier {
  bool doneDeleteNote = false;

  Future<bool> deleteNote({
    required String id,
  }) async {
    Map<String, dynamic> map = {"id": id};
    print(map);
    try {
      await dio().post(
        'deletenote.php',
        data: my_dio.FormData.fromMap(map),
      );

      doneDeleteNote = true;

      notifyListeners();
      return doneDeleteNote;
    } catch (error) {
      rethrow;
    }
  }
}
