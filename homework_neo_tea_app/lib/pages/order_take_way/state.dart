import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:homework_neo_tea_app/common/models/goods.dart';
import 'package:homework_neo_tea_app/common/models/shopping_bag.dart';

class OrderTakeWayState {
  // 商品列表
  final _goodsList = Rx<List<Content>?>(null);

  // 购物车列表
  final _shoppingBagList = Rx<List<ListElement>?>(null);

  // 购物车总价
  final _shoppingBagTotalPrice = "".obs;

  get goodsList => _goodsList.value;

  set goodsList(value) {
    _goodsList.value = value;
  }

  get shoppingBagList => _shoppingBagList.value;

  set shoppingBagList(value) {
    _shoppingBagList.value = value;
  }

  get shoppingBagTotalPrice => _shoppingBagTotalPrice.value;

  set shoppingBagTotalPrice(value) {
    this._shoppingBagTotalPrice.value = value;
  }

}
