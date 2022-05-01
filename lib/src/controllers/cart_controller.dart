import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../repository/cart_repo.dart';
import '../utilities/app_colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get getitems => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(
        product.id!,
        (value) {
          totalQuantity = value.quantity! + quantity;

          return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExite: true,
            time: DateTime.now(),
            product: product,
          );
        },
      );

      if (totalQuantity <= 0) {
        _items.remove(product.id!);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () => CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExite: true,
            time: DateTime.now(),
            product: product,
          ),
        );
      } else {
        Get.snackbar(
            "Item count", "You should at least add an item in the cart !",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    update();
  }

  existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity  += value.quantity!;
    });
    return totalQuantity;
  }

  int get priceItems {
    var totalPrice = 0;
    _items.forEach((key, value) {
      totalPrice  += value.price! *  value.quantity!;
    });
    return totalPrice;
  }

  List<CartModel> get getItems => _items.entries.map((e) => e.value).toList();

}
