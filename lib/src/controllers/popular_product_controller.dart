import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/src/utilities/app_colors.dart';
import '../models/popular_product_model.dart';
import '../repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).getProducts);
      _isLoaded = true;
      update();
    } else {}
  }

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems+_quantity;


  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // _quantity++;
      _quantity = checkQuantity(_quantity + 1);
    } else {
      // _quantity--;
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if (quantity > 20) {
      Get.snackbar("Item count", "You can't add more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(){
    _quantity=0;
    _inCartItems=0;
    // if exist
    // get from storge _inCartItems=3
  }

}
