import 'package:dio/dio.dart' as my_dio;
import 'package:hesat_quran/helpers/get_device_id.dart';

import '../helpers/dio/dio.dart';
import '../models/home_model.dart';

Future<List<HomeModel>> getHomeService() async {
  try {
    my_dio.Response response = await dio().post('all.php',
        data: my_dio.FormData.fromMap({"id": await getId(), "type": "1"}));
    print(response.data);
    return homeModelFromJson(response.toString());
  } catch (err) {
    print('$err errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    return [];
  }
}
