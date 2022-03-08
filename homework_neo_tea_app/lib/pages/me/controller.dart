import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/routes/app_pages.dart';
import 'package:homework_neo_tea_app/common/utils/util_storage.dart';
import 'package:homework_neo_tea_app/common/values/value_storage.dart';

class MePageController extends GetxController {
  handleExit() async {
    await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
    Get.offAllNamed(AppRoutes.SIGN_IN);
  }
}
