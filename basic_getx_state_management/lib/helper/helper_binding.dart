import 'package:basic_getx_state_management/controller/list_controller.dart';
import 'package:basic_getx_state_management/controller/tap_controller.dart';
import 'package:get/get.dart';

// use this on main.dart with initialBinding
class InitDependencies implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TapController());
    Get.lazyPut(() => ListController());
  }
}
