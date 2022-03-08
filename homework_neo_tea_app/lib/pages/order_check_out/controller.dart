import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/apis/address.dart';
import 'package:homework_neo_tea_app/common/apis/order.dart';
import 'package:homework_neo_tea_app/common/apis/shopping.dart';
import 'package:homework_neo_tea_app/common/models/address.dart';
import 'package:homework_neo_tea_app/common/models/order_check_out.dart';
import 'package:homework_neo_tea_app/common/models/shopping_bag.dart';
import 'package:homework_neo_tea_app/common/routes/app_pages.dart';
import 'package:homework_neo_tea_app/common/widgets/widget_toast.dart';
import 'package:homework_neo_tea_app/pages/order_check_out/state.dart';

class OrderCheckOutController extends GetxController {
  OrderCheckOutState state = OrderCheckOutState();

  asyncFetchShoppingBagData() async {
    ShoppingBagListResponseModel shoppingBagListResponseModel =
        await ShoppingBagAPI.fetchData();

    if (shoppingBagListResponseModel.code == 0 &&
        shoppingBagListResponseModel.result != null) {
      state.shoppingBagTotalPrice =
          shoppingBagListResponseModel.result!.totalPrice;
      state.shoppingBagList = shoppingBagListResponseModel.result!.list;
    }

    print(shoppingBagListResponseModel.toString());
  }

  asyncFetchAddressListData() async {
    AddressListResponseModel addressListResponseModel =
        await AddressAPI.fetchData();

    if (addressListResponseModel.code == 0 &&
        addressListResponseModel.result != null) {
      print(addressListResponseModel.toString());
      state.addressList = addressListResponseModel.result!;
    }
  }

  handleCheckOut() async {
    if (state.addressList != null) {
      OrderCheckOutRequestModel params = OrderCheckOutRequestModel(
        addressId: state.addressList[0].id,
        remark: "Test",
      );

      OrderCheckOutResponseModel model =
          await OrderAPI.checkOutOrder(params: params);

      if (model.code == 0) {
        showToast(msg: "Order Receive :)");
        Get.back();
      } else {
        showToast(msg: "Please check your network :(");
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    asyncFetchShoppingBagData();
    asyncFetchAddressListData();
  }

  handleNavMap() {
    Get.toNamed(AppRoutes.ADDRESS);
  }
}
