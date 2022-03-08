import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/pages/application/controller.dart';
import 'package:homework_neo_tea_app/pages/home/view.dart';
import 'package:homework_neo_tea_app/pages/me/view.dart';
import 'package:homework_neo_tea_app/pages/order_history/view.dart';

class ApplicationPage extends GetView<ApplicationPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildPageView() {
    return PageView(
      controller: controller.pageController,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: controller.handlePageChanged,
      children: <Widget>[
        HomePage(),
        OrderHistoryPage(),
        MePage(),
      ],
    );
  }

  _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.state.page,
          onTap: controller.handleNavBarTap,
          items: controller.bottomNavigationBarItem,
        ));
  }
}
