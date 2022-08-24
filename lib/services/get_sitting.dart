import 'package:dio/dio.dart' as my_dio;

import '../helpers/dio/dio.dart';
import '../models/my_sitting_model.dart';

Future<List<MySittingModel>> getMySittingService() async {
  try {
    my_dio.Response response = await dio().get(
      'whoisus.php',
    );

    // ignore: avoid_print
    print(response.data);
    return mySittingModelFromJson(response.toString());
  } catch (err) {
    // ignore: avoid_print
    print('$err errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    return [];
  }
}
