
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProviderData extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartInput = [];

  List<Map<String, dynamic>> get cartInput => _cartInput;

  void addToCart(List<Map<String, dynamic>> item) {
    _cartInput;
    print(item);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartInput.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cartInput.clear();
    notifyListeners();
  }
}