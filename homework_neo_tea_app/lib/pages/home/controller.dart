import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/apis/goods.dart';
import 'package:homework_neo_tea_app/common/models/goods.dart';
import 'package:homework_neo_tea_app/common/routes/app_pages.dart';
import 'package:homework_neo_tea_app/common/widgets/widget_toast.dart';
import 'package:homework_neo_tea_app/pages/home/state.dart';

class HomePageController extends GetxController
    with SingleGetTickerProviderMixin {
  final HomeState state = HomeState();

  HomePageController();

  final TextEditingController searchController = TextEditingController();

  handleLocation() {
    showToast(msg: "Top Location Click");
  }

  handleNotification() {
    showToast(msg: "Top Notification Click");
  }

  handleGoodsInfo(int index) {
    showToast(msg: index.toString());
  }

  handleHallFood() {
    showToast(msg: "Hall Food");
  }

  handleNavTakeAway() {
    Get.toNamed(AppRoutes.ORDER_TAKE_AWAY);
  }

  asyncFetchTrendingData() async {
    GoodsListResponseModel goodsListResponseModel =
        await GoodsAPI.fetchTrendingData(
      current: 1,
      pageSize: 6,
    );

    if (goodsListResponseModel.code == 0 &&
        goodsListResponseModel.result != null &&
        goodsListResponseModel.result!.content!.length > 0) {
      state.trendingList = goodsListResponseModel.result!.content!;
    }
  }

  @override
  void onReady() {
    super.onReady();
    asyncFetchTrendingData();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
