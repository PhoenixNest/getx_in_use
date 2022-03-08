import 'package:basic_getx_state_management/controller/list_controller.dart';
import 'package:basic_getx_state_management/controller/tap_controller.dart';
import 'package:get/get.dart';

// init all controller and other resources on helper at once, then all the controller will be final
// or you can use binding, check helper_binding and use it
Future<void> init() async {
  Get.lazyPut(() => TapController());
  Get.lazyPut(() => ListController());
}
