import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/src/controllers/cart_controller.dart';
import 'package:mawsil/src/models/product_model.dart';
import 'package:mawsil/src/utilities/app_colors.dart';
import '../models/cart_model.dart';
import '../models/popular_product_model.dart';
import '../repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cartController;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).getProducts);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity++;
    } else {
      _quantity--;
    }
    update();
  }

  void initProduct(ProductModel product, CartController cartController) {
    _quantity = 0;
    _inCartItems = 0;
    _cartController = cartController;
    // if exist
    bool exist = false;
    exist = _cartController.existInCart(product);
    // get from storge _inCartItems=3
    if (exist) {
      _inCartItems = _cartController.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    _cartController.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cartController.getQuantity(product);

    update();
  }

  int get totalItems => _cartController.totalItems;

  List<CartModel> get getItems => _cartController.getItems;


  bool _isAddToCart = false;
  bool get isAddToCart => _isAddToCart;
  void set setAddToCart(bool val) {
    _isAddToCart = val;
    update();
  }
}
