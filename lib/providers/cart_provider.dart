import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  bool _isPopupShow = false;
  int _totalCheckedCount = 0;
  List<Map<String, dynamic>> cartList = [];

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
}
