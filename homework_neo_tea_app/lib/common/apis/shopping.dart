import 'package:homework_neo_tea_app/common/models/shopping_bag.dart';
import 'package:homework_neo_tea_app/common/utils/util_http.dart';

class ShoppingBagAPI {
  static Future<ShoppingBagListResponseModel> fetchData() async {
    var response = await HttpUtil().get(
      "/cart/list",
      noCache: false,
      list: true,
    );
    return ShoppingBagListResponseModel.fromJson(response);
  }

  static Future<ShoppingBagListEditResponseModel> editGoods({
    required ShoppingBagListEditRequestModel params,
  }) async {
    var response = await HttpUtil().post(
      "/cart/edit",
      data: params.toJson(),
    );

    return ShoppingBagListEditResponseModel.fromJson(response);
  }

  static Future<ShoppingBagListRemoveAllResponseModel> removeAllGoods() async {
    var response = await HttpUtil().post("/cart/clear");
    return ShoppingBagListRemoveAllResponseModel.fromJson(response);
  }
}
