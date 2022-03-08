import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/models/address.dart';
import 'package:homework_neo_tea_app/common/models/shopping_bag.dart';

class OrderCheckOutState {
  // 购物车列表
  final _shoppingBagList = Rx<List<ListElement>?>(null);

  // 购物车总价
  final _shoppingBagTotalPrice = "".obs;

  // 检索地址列表，默认第一个列表项为收货地址
  final _addressList = Rx<List<AddressResult>?>(null);

  get shoppingBagList => _shoppingBagList.value;

  set shoppingBagList(value) {
    _shoppingBagList.value = value;
  }

  get shoppingBagTotalPrice => _shoppingBagTotalPrice.value;

  set shoppingBagTotalPrice(value) {
    this._shoppingBagTotalPrice.value = value;
  }

  get addressList => _addressList.value;

  set addressList(value) {
    _addressList.value = value;
  }
}
