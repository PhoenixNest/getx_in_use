import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/api/api_client.dart';
import 'package:getx_e_commerce_app/common/controller/food/cart_controller.dart';
import 'package:getx_e_commerce_app/common/controller/food/popular_controller.dart';
import 'package:getx_e_commerce_app/common/controller/food/recommend_controller.dart';
import 'package:getx_e_commerce_app/common/repository/food/cart_repo.dart';
import 'package:getx_e_commerce_app/common/repository/food/popular_repo.dart';
import 'package:getx_e_commerce_app/common/repository/food/recommend_repo.dart';
import 'package:getx_e_commerce_app/common/utils/app_constants.dart';

Future<void> globalInit() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repository
  // use Get.find() to auto find the instance
  Get.lazyPut(() => FoodPopularRepo(apiClient: Get.find()));
  Get.lazyPut(() => FoodRecommendRepo(apiClient: Get.find()));
  Get.lazyPut(() => FoodCartRepo());

  // controller
  Get.lazyPut(() => FoodPopularController(popularProductRepo: Get.find()));
  Get.lazyPut(() => FoodRecommendController(recommendProductRepo: Get.find()));
  Get.lazyPut(() => FoodCartController(foodCartRepo: Get.find()));
}
