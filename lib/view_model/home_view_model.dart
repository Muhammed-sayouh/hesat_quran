import 'package:flutter/cupertino.dart';
import 'package:hesat_quran/services/get_home_services.dart';

import '../models/home_model.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeModel> homeItems =[];
   bool Loader = true;

  Future<void> fetchHome(BuildContext context , String type) async {
    Future.delayed(Duration.zero).then((value) => notifyListeners());
    Loader = true;
    try {
      homeItems = await getHomeService(type);
      print(homeItems.length);
      Loader = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
