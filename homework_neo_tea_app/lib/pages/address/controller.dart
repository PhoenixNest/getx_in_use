import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/apis/address.dart';
import 'package:homework_neo_tea_app/common/models/address.dart';
import 'package:homework_neo_tea_app/common/models/address_edit.dart';
import 'package:homework_neo_tea_app/pages/address/state.dart';

class AddressPageController extends GetxController {
  AddressState state = AddressState();

  asyncFetchAddressListData() async {
    AddressListResponseModel addressListResponseModel =
        await AddressAPI.fetchData();

    if (addressListResponseModel.code == 0 &&
        addressListResponseModel.result != null) {
      state.addressList = addressListResponseModel.result!;
    }
  }

  handleAddAddress() async {
    AddressEditRequestModel params = AddressEditRequestModel(
      address: "吉林大学珠海学院",
      receiver: "-3-",
      phone: "1234567890",
      longitude: 214.424,
      latitude: 424.214,
    );

    AddressEditResponseModel addressEditResponseModel =
        await AddressAPI.addAddress(
      params: params,
    );

    asyncFetchAddressListData();
  }

  @override
  void onInit() {
    super.onInit();
    asyncFetchAddressListData();
  }
}
