import 'dart:convert';
import 'dart:developer';

import 'package:mawsil/src/utilities/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList){
    cart = [];
    /*
      convert object to string becuese [sharedPreferences] only accepts string
    */ 
    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart.toList());
    // log(sharedPreferences.getStringList(AppConstants.CART_LIST).toString());
    // log(getCartList());
    // getCartList.forEach((element)=>log(element.price.toString()));
  }

  
  List<CartModel> get getCartList {
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      cart = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }

    List<CartModel> cartList = [];

    cart.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList ;
  }
}