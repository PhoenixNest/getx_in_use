import 'package:get/get.dart';
import 'package:homework_neo_tea_app/pages/application/controller.dart';
import 'package:homework_neo_tea_app/pages/home/controller.dart';
import 'package:homework_neo_tea_app/pages/me/controller.dart';
import 'package:homework_neo_tea_app/pages/order_history/controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationPageController>(() => ApplicationPageController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<OrderHistoryPageController>(() => OrderHistoryPageController());
    Get.lazyPut<MePageController>(() => MePageController());
  }
}
