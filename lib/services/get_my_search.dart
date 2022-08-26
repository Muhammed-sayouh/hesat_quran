import 'package:dio/dio.dart' as my_dio;

import '../helpers/dio/dio.dart';
import '../models/search_model.dart';

Future<List<SearchModel>> searchService(String word) async {
  try {
    my_dio.Response response = await dio()
        .post('searchword.php', data: my_dio.FormData.fromMap({"word": word}));
    print(response.data);
    return searchModelFromJson(response.toString());
  } catch (err) {
    print('$err errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    return [];
  }
}
