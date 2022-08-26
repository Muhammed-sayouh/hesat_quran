import 'package:flutter/cupertino.dart';
import 'package:hesat_quran/services/get_home_services.dart';

import '../models/home_model.dart';
import '../models/sora_model.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeModel> homeItems = [];
  List<SoraModel> soraInfo = [];
  bool Loader = true;


  Future<void> fetchHome(BuildContext context, String type, String id) async {
    Future.delayed(Duration.zero).then((value) => notifyListeners());
    Loader = true;
    try {
      homeItems = await getHomeService(type, id);
      print(homeItems.length);
      Loader = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> getSora(BuildContext context, String type, String id) async {
    Future.delayed(Duration.zero).then((value) => notifyListeners());
    Loader = true;
    try {
      soraInfo = await getsoraInfo(type, id);
      print(homeItems.length);
      Loader = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addUserToken() async {
    
    try {
      await homeAddToken();
    } catch (error) {
      rethrow;
    }
  }
}
