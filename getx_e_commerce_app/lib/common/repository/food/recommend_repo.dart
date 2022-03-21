import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/api/api_client.dart';
import 'package:getx_e_commerce_app/common/utils/app_constants.dart';

class FoodRecommendRepo extends GetxService {
  final ApiClient apiClient;

  FoodRecommendRepo({
    required this.apiClient,
  });

  Future<Response> getRecommendProductList() async {
    return await apiClient.getData(AppConstants.GOODS_RECOMMEND_URI);
  }
}
