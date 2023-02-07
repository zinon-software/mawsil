import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_model.dart';
import '../utilities/app_constants.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cartList = [];
  List<String> cartListHistory = [];

  void addToCartStorageList(List<CartModel> _cartList) {
    // sharedPreferences.remove(AppConstants.CART_LIST);
    // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    cartList = [];
    DateTime time = DateTime.now();
    /**
     * convert object to string becuese [sharedPreferences] only accepts string
     */
    _cartList.forEach((element) {
      element.time = time;
      return cartList.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cartList.toList());
  }

  List<CartModel> get getCartStorageList {
    List<CartModel> _cartList = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      cartList = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      cartList.forEach((element) {
        _cartList.add(CartModel.fromJson(jsonDecode(element)));
      });
    }

    return _cartList;
  }

  addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartListHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    cartListHistory.addAll(cartList);
    removeCart();
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartListHistory);
  }

  List<CartModel> getCartHistoryList() {
    List<CartModel> _cartListHistory = [];
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartListHistory = [];
      cartListHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
      cartListHistory.forEach((element) {
        _cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
      });
    }
    return _cartListHistory;
  }

  void removeCart() {
    cartList = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
