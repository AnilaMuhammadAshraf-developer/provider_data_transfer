import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  bool _isPopupShow = false;
  int _totalCheckedCount = 0;
  double _subTotal=0;
  final double _shipping=2.99;
  List<Map<String, dynamic>> cartList = [];
  
  double get shipping=>_shipping;
 double get subTotal=> _subTotal;
  bool get isPopupShow => _isPopupShow;

  int get totalCheckedCount => _totalCheckedCount;

  void addProduct(data) {
    bool isAlreadyAdded = cartList.any(
      (item) => item['title'] == data['title'],
    );
    data['id'] = cartList.length + 1;
    data['isChecked'] = false;

    if (!isAlreadyAdded) {
      cartList.add(data);
      print("the list will be :$cartList");
    } else {
      print("already  hai ");
      _isPopupShow = true;
    }
    notifyListeners();
  }

  void updateIsChecked(int id) {
    for (var item in cartList) {
      if (item['id'] == id) {
        print("before updated checkbox ${item['isChecked']}");
        item['isChecked'] = !item['isChecked'];
        break;
      }
      print("after updated checkbox ${item['isChecked']}");
    }
    _totalCheckedCount =
        cartList.where((item) => item['isChecked'] == true).length;

    notifyListeners();
  }

  void updatePopupStatus() {
    _isPopupShow = false;
    print("false krdya h $_isPopupShow");
    notifyListeners();
  }

  void cartProductDelete() {
    cartList.removeWhere((item) => item['isChecked'] == true);
    _totalCheckedCount =
        cartList.where((item) => item['isChecked'] == true).length;
    notifyListeners();
  }

  void getCartTotal(){
    _subTotal=0;
     _subTotal =cartList.map((item) => item['price'] ?? 0.0).fold(0.0, (prev, price) => prev + price);
    notifyListeners();
  }

  void clearCartList(){
     if (cartList.isNotEmpty) {
    cartList.clear();
    notifyListeners();
     }
  }
}
