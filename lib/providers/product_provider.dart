import 'package:flutter/foundation.dart';
import 'package:provider_data_transfer/constants/product_data.dart';

class ProductProvider with ChangeNotifier {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> mainLists = ProductData.drinkProducts;

  int get selectedIndex => _selectedIndex;

  void onSelection(int index) {
    print("yahn p index update ho ra h provider use kr k . $index");
    _selectedIndex = index;
    if (index == 0) {
       mainLists = ProductData.drinkProducts;
        notifyListeners();
    }
    if (index == 1) {
      mainLists = ProductData.foodProducts;
      print("yahn list change hui hai ");
        notifyListeners();
    }
    if (index == 2) {
      mainLists = ProductData.foodProducts;
        notifyListeners();
    }
    if (index == 3) {
      mainLists = ProductData.foodProducts;
        notifyListeners();
    }
    notifyListeners();
  }
}
