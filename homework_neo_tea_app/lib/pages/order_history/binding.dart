import 'package:get/get.dart';
import 'package:homework_neo_tea_app/pages/order_history/controller.dart';

class OrderHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderHistoryPageController>(() => OrderHistoryPageController());
  }
}
