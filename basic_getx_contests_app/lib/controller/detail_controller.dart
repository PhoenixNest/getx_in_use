import 'package:get/get.dart';

class DetailController extends GetxController {
  var favouriteCount = 0.obs;

  void favouriteCounter() {
    if (favouriteCount.value == 1) {
      Get.snackbar("Loved it", "You already loved it");
    } else {
      favouriteCount.value++;
      Get.snackbar("Loved it", "You just loved it");
    }
  }
}
