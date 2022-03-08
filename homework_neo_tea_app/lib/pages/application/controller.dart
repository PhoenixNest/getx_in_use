import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/pages/application/state.dart';

class ApplicationPageController extends GetxController {
  ApplicationPageController();

  final state = ApplicationState();
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomNavigationBarItem;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: state.page);
    bottomNavigationBarItem = [
      BottomNavigationBarItem(
        // 首页
        icon: Icon(Icons.home_filled),
        label: 'application_bottom_label_home'.tr,
      ),
      BottomNavigationBarItem(
        // 订单
        icon: Icon(Icons.bookmark_border),
        label: 'application_bottom_label_order'.tr,
      ),
      BottomNavigationBarItem(
        // 我的
        icon: Icon(Icons.account_circle_rounded),
        label: 'application_bottom_label_me'.tr,
      )
    ];
  }

  void handlePageChanged(int page) {
    state.page = page;
  }

  void handleNavBarTap(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 240),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
