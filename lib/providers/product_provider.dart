import 'package:flutter/foundation.dart';
import 'package:provider_data_transfer/constants/product_data.dart';

class ProductProvider with ChangeNotifier {
  int _selectedIndex = 0;
  int _cartCount=01;
  final int _myCartCount=0;
  List<Map<String, dynamic>> productList = ProductData.drinkProducts['products'];
   int totalCount = ProductData.drinkProducts['totalCount'];
   String productType=ProductData.drinkProducts['type'];
    String _searchQuery = '';
  
  
  int get selectedIndex => _selectedIndex;
  int get cartCount =>_cartCount;

  int get myCartCount=>_myCartCount;
  // search wala kam 
  // Expose filtered products only
  List<Map<String, dynamic>> get filteredProducts {
    if (_searchQuery.isEmpty) {
      return productList;
    } else {
      final filtered = productList.where((product) {
        final title = product['title']?.toLowerCase() ?? '';
        return title.contains(_searchQuery.toLowerCase());
      }).toList();
      totalCount=filtered.length;
      return filtered;
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
 // end search work

  void onSelection(int index) {
    print("yahn p index update ho ra h provider use kr k . $index");
    _selectedIndex = index;
    if (index == 0) {
       productList = ProductData.drinkProducts['products'];
       totalCount = ProductData.drinkProducts['totalCount'];
       productType = ProductData.drinkProducts['type'];
       print("totalCount:$totalCount");
       
    }
    else if (index == 1) {
       productList = ProductData.foodProducts['products'];
       totalCount = ProductData.foodProducts['totalCount'];
         productType = ProductData.foodProducts['type'];
      print("yahn list change hui hai ");
       print("totalCount:$totalCount");
     
    }
   else if (index == 2) {
       productList = ProductData.healthProducts['products'];
       totalCount = ProductData.healthProducts['totalCount'];
        productType = ProductData.healthProducts['type'];
    }
    else if (index == 3) {
      productList = ProductData.gameProducts['products'];
      totalCount = ProductData.gameProducts['totalCount'];
      productType = ProductData.gameProducts['type'];
    }
    _searchQuery = '';
    notifyListeners();
  }


 void incrementCount(){
  print("yh value brhaegga wo function hai");
    _cartCount ++;
      notifyListeners();
 }
  void decrementCount(){
    print("yeh value km krega wo function hai .");
    if(cartCount>1){
    _cartCount --;
    }
      notifyListeners();
 }

 void resetCount(){
    _cartCount=1;
      notifyListeners();
 }
}
