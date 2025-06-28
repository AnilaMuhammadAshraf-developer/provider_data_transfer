import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  int _selectedIndex = 0;


  int get selectedIndex => _selectedIndex;

  void onSelection(int index) {
    print("yahn p index update ho ra h provider use kr k . $index");
     _selectedIndex=index;
    notifyListeners();
  }
}
