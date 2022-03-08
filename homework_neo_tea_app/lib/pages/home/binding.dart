import 'package:get/get.dart';
import 'package:homework_neo_tea_app/pages/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
