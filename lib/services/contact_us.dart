import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as my_dio;

import '../helpers/dio/dio.dart';

class ContactUsService with ChangeNotifier {
  bool done = false;

  Future<bool> contactUsSrevices({required String name, required String phone,required String supject, required String message}) async {
   
    Map<String, dynamic> map = {
      'name': name,
      "phone": phone,
      "subject":supject,
      "message":message,
     
    };
    print(map);
    try {
      my_dio.Response response = await dio().post(
        'contactus.php',
        data: my_dio.FormData.fromMap(map),
      );

      done = true;

      notifyListeners();
      return done;
    } catch (error) {
      rethrow;
    }
  }
}
