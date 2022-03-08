import 'package:get/get.dart';
import 'package:homework_neo_tea_app/pages/sign_up/controller.dart';

class SignUpPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpPageController>(() => SignUpPageController());
  }
}
