import 'package:dio/dio.dart' as my_dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hesat_quran/helpers/get_device_id.dart';

import '../helpers/dio/dio.dart';
import '../models/home_model.dart';
import '../models/sora_model.dart';

Future<List<HomeModel>> getHomeService(String type, String id) async {
  try {
    my_dio.Response response = await dio().post('all.php',
        data: my_dio.FormData.fromMap({"id": id, "type": type}));
    // print(response.data);
    return homeModelFromJson(response.toString());
  } catch (err) {
    print('$err errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    return [];
  }
}

Future<List<SoraModel>> getsoraInfo(String type, String id) async {
  try {
    my_dio.Response response = await dio().post('all.php',
        data: my_dio.FormData.fromMap({"id": id, "type": type}));
    // print(response.data);
    return SoraModelFromJson(response.toString());
  } catch (err) {
    print('$err errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    return [];
  }
}

Future<void> homeAddToken() async {
  String? token;
  try {
    await FirebaseMessaging.instance.getToken().then((value) => token = value);

    Map<String, dynamic> map = {
      "token": token,
      "user_id": await getId(),
    };

    my_dio.Response response =
        await dio().post('addtoken.php', data: my_dio.FormData.fromMap(map));
    print(response.data);
  } catch (err) {
    rethrow;
  }
}

Future<void> updateSoura(
    {String? read, String? listen, required String soraId}) async {
  try {
    Map<String, dynamic> map = {
      "id": soraId,
      "read": read,
      "listen": listen,
    };
    my_dio.Response response =
        await dio().post('updatesoura.php', data: my_dio.FormData.fromMap(map));
    print("${response.data}cccccccccccccccccccccccccccccccccccccccccc");
  } catch (err) {
    rethrow;
  }
}
