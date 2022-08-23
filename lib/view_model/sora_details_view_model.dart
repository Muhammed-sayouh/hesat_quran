import 'package:flutter/cupertino.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/services/get_my_categories.dart';

import '../models/categories_model.dart';

class SoraDetialsViewModel with ChangeNotifier {
  bool expand = false;
  List<CategoriesModel> categories = [];
  bool categoriesLoader = true;
  int? initialPageNumber;
  String? imageUrl;

  void expandList() {
    expand = true;
    notifyListeners();
  }

  Future<void> fetchCategories(BuildContext context) async {
    Future.delayed(Duration.zero).then((value) => notifyListeners());
    categoriesLoader = true;
    try {
      categories = await myCategoriesService();
      print(categories.length);
      categoriesLoader = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  void imageLink({required String page}) {
    imageUrl = Constants.imagesUrl + page;
    initialPageNumber = int.parse(page.split('.jpg')[0]);
    notifyListeners();
  }

  void nextPage() {
    initialPageNumber = initialPageNumber! + 1;

    imageUrl = Constants.imagesUrl +
        initialPageNumber.toString().padLeft(4, '0') +
        '.jpg';

    print(imageUrl);
    notifyListeners();
  }

  void previousPage() {
    if (initialPageNumber! > 1) {
      initialPageNumber = initialPageNumber! - 1;
      imageUrl = Constants.imagesUrl +
          initialPageNumber.toString().padLeft(4, '0') +
          '.jpg';

      print(imageUrl);
      notifyListeners();
    }
  }
}
