import 'package:flutter/material.dart';
import 'package:add_cart_app/models/products_model.dart';

class CartProvider with ChangeNotifier {
  final Map<Products, int> _cartItems = {};

  Map<Products, int> get cartItems => _cartItems;

  int get cartItemCount {
    
    return _cartItems.values.fold(0, (previousValue, quantity) => previousValue + quantity);
  }

  void addToCart(Products product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }
 


  void removeFromCart(Products product) {
    _cartItems.remove(product);
    notifyListeners();
  }
  
}




 

