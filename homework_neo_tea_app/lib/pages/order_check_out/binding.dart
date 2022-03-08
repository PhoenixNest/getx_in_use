import 'package:get/get.dart';
import 'package:homework_neo_tea_app/pages/order_check_out/controller.dart';

class OrderCheckOutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderCheckOutController>(() => OrderCheckOutController());
  }
}
