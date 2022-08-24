import 'package:dio/dio.dart' as my_dio;
import 'package:hesat_quran/helpers/get_device_id.dart';

import '../helpers/dio/dio.dart';
import '../models/readers_model.dart';

Future<List<ReadersModel>> getReadersService() async {
  try {
    my_dio.Response response = await dio().post('readers.php',
        data: my_dio.FormData.fromMap({"user_id": await getId()}));
    // ignore: avoid_print
    print(response.data);
    return readersModelFromJson(response.toString());
  } catch (err) {
    // ignore: avoid_print
    print('$err errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    return [];
  }
}
