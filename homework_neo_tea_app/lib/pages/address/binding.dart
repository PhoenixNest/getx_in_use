import 'package:get/get.dart';
import 'package:homework_neo_tea_app/pages/address/controller.dart';

class AddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressPageController>(() => AddressPageController());
  }
}
