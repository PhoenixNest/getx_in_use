import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/api/api_client.dart';
import 'package:getx_e_commerce_app/common/utils/app_constants.dart';

class FoodPopularRepo extends GetxService {
  final ApiClient apiClient;

  FoodPopularRepo({
    required this.apiClient,
  });

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.GOODS_POPULAR_URI);
  }
}
