import 'package:dio/dio.dart' as my_dio;
import 'package:hesat_quran/helpers/get_device_id.dart';

import '../helpers/dio/dio.dart';
import '../models/my_mission_model.dart';

Future<List<MyMissionsModel>> myMissionsService() async {
  try {
    my_dio.Response response = await dio().post('mymissions.php',
        data: my_dio.FormData.fromMap({"user_id": await getId()}));
    print(response.data);
    return myMissionsModelFromJson(response.toString());
  } catch (err) {
    print('$err errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    return [];
  }
}
