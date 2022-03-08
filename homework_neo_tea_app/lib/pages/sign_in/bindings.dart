import 'package:get/get.dart';

import 'controller.dart';

class SignInPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInPageController>(() => SignInPageController());
  }
}
