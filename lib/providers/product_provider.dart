import 'package:flutter/foundation.dart';
import 'package:provider_data_transfer/constants/product_data.dart';

class ProductProvider with ChangeNotifier {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> productList = ProductData.drinkProducts['products'];
   int totalCount = ProductData.drinkProducts['totalCount'];


  int get selectedIndex => _selectedIndex;

  void onSelection(int index) {
    print("yahn p index update ho ra h provider use kr k . $index");
    _selectedIndex = index;
    if (index == 0) {
       productList = ProductData.drinkProducts['products'];
       totalCount = ProductData.drinkProducts['totalCount'];
       print("totalCount:$totalCount");
       
    }
    if (index == 1) {
       productList = ProductData.foodProducts['products'];
       totalCount = ProductData.foodProducts['totalCount'];
      print("yahn list change hui hai ");
       print("totalCount:$totalCount");
     
    }
    if (index == 2) {
       productList = ProductData.healthProducts['products'];
       totalCount = ProductData.healthProducts['totalCount'];
    }
    if (index == 3) {
      productList = ProductData.gameProducts['products'];
      totalCount = ProductData.gameProducts['totalCount'];
    }
    notifyListeners();
  }
}
