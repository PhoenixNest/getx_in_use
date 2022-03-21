import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/repository/food/recommend_repo.dart';
import 'package:getx_e_commerce_app/common/models/goods.dart';

class FoodRecommendController extends GetxController {
  final FoodRecommendRepo recommendProductRepo;

  bool _isLoaded = false;
  List<GoodsModel> _recommendGoodsList = [];

  bool get isLoaded => _isLoaded;

  List<GoodsModel> get recommendGoodsList => _recommendGoodsList;

  FoodRecommendController({
    required this.recommendProductRepo,
  });

  Future<void> fetchRecommendListData() async {
    Response response = await recommendProductRepo.getRecommendProductList();
    if (response.statusCode == 200) {
      _recommendGoodsList = [];
      _recommendGoodsList.addAll(Goods.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
