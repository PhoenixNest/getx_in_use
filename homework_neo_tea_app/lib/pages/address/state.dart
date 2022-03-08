import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/models/address.dart';

class AddressState {
  final _addressList = Rx<List<AddressResult>?>(null);

  get addressList => _addressList.value;

  set addressList(value) {
    _addressList.value = value;
  }
}
