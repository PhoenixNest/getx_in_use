import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:homework_neo_tea_app/common/models/order.dart';

class OrderHistoryState {
  final _orderHistoryList = Rx<List<Content>?>(null);

  get orderHistoryList => _orderHistoryList.value;

  set orderHistoryList(value) {
    _orderHistoryList.value = value;
  }
}
