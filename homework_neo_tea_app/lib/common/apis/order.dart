import 'package:homework_neo_tea_app/common/models/order.dart';
import 'package:homework_neo_tea_app/common/models/order_check_out.dart';
import 'package:homework_neo_tea_app/common/utils/util_http.dart';

class OrderAPI {
  static Future<OrderHistoryListResponseModel> fetchData() async {
    var response = await HttpUtil().get("/order/list");
    return OrderHistoryListResponseModel.fromJson(response);
  }

  static Future<OrderCheckOutResponseModel> checkOutOrder({
    required OrderCheckOutRequestModel params,
    String? remarks,
  }) async {
    var response = await HttpUtil().post(
      "/order/submit",
      data: params,
    );

    return OrderCheckOutResponseModel.fromJson(response);
  }
}
