import 'package:dio/dio.dart' as my_dio;
import 'package:hesat_quran/helpers/get_device_id.dart';

import '../helpers/dio/dio.dart';
import '../models/categories_model.dart';

Future<List<CategoriesModel>> myCategoriesService() async {
  try {
    my_dio.Response response = await dio().post('allcats.php',
        data: my_dio.FormData.fromMap({"user_id": await getId()}));
    print(response.data);
    return categoriesModelFromJson(response.toString());
  } catch (err) {
    print('$err errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    return [];
  }
}
