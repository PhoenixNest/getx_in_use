import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/routes/app_pages.dart';
import 'package:homework_neo_tea_app/global.dart';

class WelcomeController extends GetxController {
  handleSimpleNavSignIn() {
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

  handleNavSignIn() {
    Global.saveFirstOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
