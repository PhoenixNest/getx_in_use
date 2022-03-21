import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/controller/food/popular_controller.dart';
import 'package:getx_e_commerce_app/common/controller/food/recommend_controller.dart';
import 'package:getx_e_commerce_app/common/helper/dependencies.dart';
import 'package:getx_e_commerce_app/common/helper/routes.dart';
import 'package:getx_e_commerce_app/page/home/food/cart/cart.dart';

void main() async {
  // force the engine to await the things we need to be initialize first
  WidgetsFlutterBinding.ensureInitialized();
  await globalInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<FoodPopularController>().fetchPopularListData();
    Get.find<FoodRecommendController>().fetchRecommendListData();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: RouteHelper.initialHomePage,
      getPages: RouteHelper.routes,
    );
  }
}
