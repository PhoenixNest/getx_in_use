import 'package:get/get.dart';
import 'package:getx_e_commerce_app/page/home/food/popular/popular_details.dart';
import 'package:getx_e_commerce_app/page/home/food/recommend/recommend_detail.dart';
import 'package:getx_e_commerce_app/page/home/home.dart';

class RouteHelper {
  static const String initialHomePage = "/";
  static const String foodPopularDetailsPage = "/popular";
  static const String foodRecommendDetailsPage = "/recommend";

  static String getInitialHomePage() => "$initialHomePage";

  static String getPopularFoodPage(int pageId) {
    return "$foodPopularDetailsPage?pageId=$pageId";
  }

  static String getRecommendFoodPage(int pageId) {
    return "$foodRecommendDetailsPage?pageId=$pageId";
  }

  static List<GetPage> routes = [
    GetPage(
      name: "/",
      page: () => const HomePage(),
    ),
    GetPage(
      name: "/popular",
      page: () {
        var pageId = Get.parameters["pageId"];
        return FoodPopularDetailPage(pageId: int.parse(pageId!));
      },
    ),
    GetPage(
      name: "/recommend",
      page: () {
        var pageId = Get.parameters["pageId"];
        return FoodRecommendDetailsPage(pageId: int.parse(pageId!));
      },
    ),
  ];
}
