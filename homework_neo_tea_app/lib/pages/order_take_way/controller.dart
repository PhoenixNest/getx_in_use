import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/apis/goods.dart';
import 'package:homework_neo_tea_app/common/apis/shopping.dart';
import 'package:homework_neo_tea_app/common/models/goods.dart';
import 'package:homework_neo_tea_app/common/models/shopping_bag.dart';
import 'package:homework_neo_tea_app/common/routes/app_pages.dart';
import 'package:homework_neo_tea_app/common/widgets/widget_toast.dart';
import 'package:homework_neo_tea_app/pages/order_take_way/state.dart';

class OrderTakeAwayController extends GetxController
    with SingleGetTickerProviderMixin {
  final OrderTakeWayState state = OrderTakeWayState();

  late final TabController tabController;

  asyncFetchGoodsData() async {
    GoodsListResponseModel goodsListResponseModel = await GoodsAPI.fetchData(
      current: 1,
      pageSize: 10,
    );

    if (goodsListResponseModel.code == 0 &&
        goodsListResponseModel.result != null &&
        goodsListResponseModel.result!.content!.length > 0) {
      state.goodsList = goodsListResponseModel.result!.content!;
    }
  }

  asyncFetchShoppingBagData() async {
    ShoppingBagListResponseModel shoppingBagListResponseModel =
        await ShoppingBagAPI.fetchData();

    if (shoppingBagListResponseModel.code == 0 &&
        shoppingBagListResponseModel.result != null) {
      state.shoppingBagTotalPrice =
          shoppingBagListResponseModel.result!.totalPrice;
      state.shoppingBagList = shoppingBagListResponseModel.result!.list;
    }

    print(shoppingBagListResponseModel.toString());
  }

  asyncAddShoppingGoods({
    required int? goodsId,
    required List<ListElement> shoppingBagList,
  }) async {
    int currentNum = 0;

    shoppingBagList.forEach(
      (element) {
        if (element.goodsId == goodsId) {
          currentNum = element.buyNum!;
        }
      },
    );

    currentNum += 1;

    await ShoppingBagAPI.editGoods(
      params: ShoppingBagListEditRequestModel(
        id: goodsId.toString(),
        buyNum: currentNum,
      ),
    );
  }

  asyncRemoveShoppingGoods({
    required int? goodsId,
    required List<ListElement> shoppingBagList,
  }) async {
    int currentNum = 0;

    shoppingBagList.forEach(
      (element) {
        if (element.goodsId == goodsId) {
          currentNum = element.buyNum!;
        }
      },
    );

    if (currentNum == 0) {
      await ShoppingBagAPI.editGoods(
        params: ShoppingBagListEditRequestModel(
          id: goodsId.toString(),
          buyNum: 0,
        ),
      );
    } else {
      currentNum -= 1;

      await ShoppingBagAPI.editGoods(
        params: ShoppingBagListEditRequestModel(
          id: goodsId.toString(),
          buyNum: currentNum,
        ),
      );
    }
  }

  handleRemoveAllGoods() async {
    await ShoppingBagAPI.removeAllGoods();

    asyncFetchShoppingBagData();
  }

  handleCheckOut() {
    if (state.shoppingBagTotalPrice.toString() == "0") {
      showToast(msg: "order_take_away_checkout_empty_shopping_bag".tr);
    } else {
      Get.toNamed(AppRoutes.ORDER_CHECK_OUT);
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
    asyncFetchGoodsData();
    asyncFetchShoppingBagData();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
