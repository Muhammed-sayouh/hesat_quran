import 'package:dio/dio.dart' as my_dio;

import '../helpers/dio/dio.dart';
import '../models/category_details_model.dart';

Future<CategoriesDetailsModelModel> categoryDetailsService(
    {required String catId, required String soraId}) async {
  try {
    my_dio.Response response = await dio().post('catdetails.php',
        data: my_dio.FormData.fromMap({"cat_id": catId, "soura_id": soraId}));
    print(response.data);
    return categoriesDetailsModelModelFromJson(response.toString());
  } catch (err) {
    print('$err errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    return CategoriesDetailsModelModel(
        success: false,
        id: '',
        catId: '',
        souraId: '',
        details: '',
        date: DateTime.now());
  }
}
