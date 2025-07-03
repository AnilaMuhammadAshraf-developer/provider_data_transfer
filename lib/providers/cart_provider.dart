import 'package:flutter/foundation.dart';


class CartProvider with ChangeNotifier {
 
  int _myCartCount=3;
  bool _isCheckedCartProduct=true;
  List<Map<String, dynamic>> cartList = [];
  
  
  bool get isCheckedCartProduct=>_isCheckedCartProduct;
  int get myCartCount =>_myCartCount;
   
   void addProduct(data){
       cartList.add(data);
       print("the list will be :$cartList");      
    notifyListeners();
   }
 void updateIsChecked(){
     _isCheckedCartProduct=!_isCheckedCartProduct;
     print("updated checkbox:$isCheckedCartProduct");
 }
  
}
