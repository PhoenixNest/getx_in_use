import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/models/cart.dart';
import 'package:getx_e_commerce_app/common/models/goods.dart';
import 'package:getx_e_commerce_app/common/repository/food/cart_repo.dart';
import 'package:getx_e_commerce_app/common/utils/colors.dart';

class FoodCartController extends GetxController {
  final FoodCartRepo foodCartRepo;

  Map<int, CartModel> _goods = {};

  Map<int, CartModel> get goods => _goods;

  FoodCartController({required this.foodCartRepo});

  void addGoods(GoodsModel product, int quantity) {
    // always check the current goods num before we modify it in the cart
    var totalGoodsNum = 0;

    // check the id first if we try to update the cart
    if (_goods.containsKey(product.id)) {
      _goods.update(product.id!, (value) {
        totalGoodsNum = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });

      if (totalGoodsNum <= 0) {
        _goods.remove(product.id);
      }
    } else if (quantity > 0) {
      // if the product is not added to the cart never before, add an new one
      // Absent function will auto check the duplicate items
      _goods.putIfAbsent(
        product.id!,
        () => CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
        ),
      );
    } else {
      Get.snackbar(
        "Item count",
        "You should at least add an item into the cart",
        colorText: Colors.white,
        backgroundColor: AppColors.mainColor,
      );
    }
  }

  // check if the goods is in cart
  bool checkCart(GoodsModel product) {
    if (_goods.containsKey(product.id)) {
      return true;
    }

    return false;
  }

  int getGoodsNum(GoodsModel product) {
    var goodsNum = 0;
    if (_goods.containsKey(product.id)) {
      goods.forEach((key, value) {
        if (key == product.id) {
          goodsNum = value.quantity!;
        }
      });
    }

    return goodsNum;
  }

  int get totalGoodsNum {
    var totalGoodsNum = 0;

    _goods.forEach((key, value) {
      totalGoodsNum += value.quantity!;
    });

    return totalGoodsNum;
  }

  List<CartModel> get getCartList {
    return _goods.entries.map((cartModel) {
      return cartModel.value;
    }).toList();
  }
}
