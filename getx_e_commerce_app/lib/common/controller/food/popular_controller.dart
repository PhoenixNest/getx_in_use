import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/controller/food/cart_controller.dart';
import 'package:getx_e_commerce_app/common/models/cart.dart';
import 'package:getx_e_commerce_app/common/models/goods.dart';
import 'package:getx_e_commerce_app/common/repository/food/popular_repo.dart';
import 'package:getx_e_commerce_app/common/utils/colors.dart';

class FoodPopularController extends GetxController {
  final FoodPopularRepo popularProductRepo;

  // product Data list
  bool _isLoaded = false;
  int _goodsNum = 0;
  int _inCartGoodsNum = 0;
  List<GoodsModel> _popularGoodsList = [];

  // shop cart
  late FoodCartController _cartController;

  bool get isLoaded => _isLoaded;

  int get quantity => _goodsNum;

  int get inCartGoodsNum => _inCartGoodsNum + _goodsNum;

  List<GoodsModel> get popularGoodsList => _popularGoodsList;

  FoodPopularController({
    required this.popularProductRepo,
  });

  // init Data
  void initShoppingCart(GoodsModel product, FoodCartController cartController) {
    _goodsNum = 0;
    _inCartGoodsNum = 0;
    _cartController = cartController;

    var exist = false;
    exist = _cartController.checkCart(product);

    if (exist) {
      _inCartGoodsNum = _cartController.getGoodsNum(product);
    }
  }

  // fetch Data
  Future<void> fetchPopularListData() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularGoodsList = [];
      _popularGoodsList.addAll(Goods.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  // handle add and remove function
  // - add goods
  // - remove goods
  void setGoodsNum(bool isIncrement) {
    if (isIncrement) {
      _goodsNum = checkGoodsNum(_goodsNum + 1);
    } else {
      _goodsNum = checkGoodsNum(_goodsNum - 1);
    }

    update();
  }

  int checkGoodsNum(int quantity) {
    if (_inCartGoodsNum + quantity < 0) {
      Get.snackbar(
        "Item count",
        "You cant reduce more",
        colorText: Colors.white,
        backgroundColor: AppColors.mainColor,
      );

      if (_inCartGoodsNum > 0) {
        _goodsNum = -_inCartGoodsNum;
        return _goodsNum;
      }

      return 0;
    } else if (_inCartGoodsNum + quantity > 20) {
      Get.snackbar(
        "Item count",
        "You cant add more",
        colorText: Colors.white,
        backgroundColor: AppColors.mainColor,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  // cart
  void addGoodsToCart(GoodsModel product) {
    _cartController.addGoods(product, _goodsNum);

    _goodsNum = 0;
    _inCartGoodsNum = _cartController.getGoodsNum(product);

    update();
  }

  int get totalGoodsNum {
    return _cartController.totalGoodsNum;
  }

  List<CartModel> get getCartList{
    return _cartController.getCartList;
  }
}
