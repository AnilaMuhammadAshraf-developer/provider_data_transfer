import 'package:flutter/foundation.dart';


class CartProvider with ChangeNotifier {
 
  int _myCartCount=3;
  List<Map<String, dynamic>> cartList = [];

  

  int get myCartCount =>_myCartCount;
   
   void addProduct(data){
       cartList.add(data);
       print("the list will be :$cartList");      
    notifyListeners();
   }
 
  
}
