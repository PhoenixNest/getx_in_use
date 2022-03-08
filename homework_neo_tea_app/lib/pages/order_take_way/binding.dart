import 'package:get/get.dart';
import 'package:homework_neo_tea_app/pages/order_take_way/controller.dart';

class OrderTakeAwayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderTakeAwayController>(() => OrderTakeAwayController());
  }
}
