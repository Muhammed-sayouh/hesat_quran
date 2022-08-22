import 'package:flutter/cupertino.dart';

class SoraDetialsViewModel with ChangeNotifier {
  bool expand = false;

  void expandList() {
    expand = true;
    notifyListeners();
  }
}
