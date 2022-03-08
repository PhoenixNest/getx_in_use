import 'package:get/get.dart';
import 'package:homework_neo_tea_app/pages/me/controller.dart';

class MeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MePageController>(() => MePageController());
  }
}
