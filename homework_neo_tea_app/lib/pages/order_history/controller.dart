import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/apis/order.dart';
import 'package:homework_neo_tea_app/common/models/order.dart';
import 'package:homework_neo_tea_app/pages/order_history/state.dart';

class OrderHistoryPageController extends GetxController {
  OrderHistoryState state = OrderHistoryState();

  asyncFetchOrderHistoryListData() async {
    OrderHistoryListResponseModel orderHistoryListResponseModel =
        await OrderAPI.fetchData();

    if (orderHistoryListResponseModel.code == 0 &&
        orderHistoryListResponseModel.result != null &&
        orderHistoryListResponseModel.result!.content!.length > 0) {
      state.orderHistoryList = orderHistoryListResponseModel.result!.content!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    asyncFetchOrderHistoryListData();
  }
}
