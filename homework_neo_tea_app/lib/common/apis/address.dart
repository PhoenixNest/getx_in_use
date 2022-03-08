import 'package:homework_neo_tea_app/common/models/address.dart';
import 'package:homework_neo_tea_app/common/models/address_edit.dart';
import 'package:homework_neo_tea_app/common/utils/util_http.dart';

class AddressAPI {
  static Future<AddressListResponseModel> fetchData() async {
    var response = await HttpUtil().get("/address/list");
    return AddressListResponseModel.fromJson(response);
  }

  static Future<AddressEditResponseModel> addAddress({
    required AddressEditRequestModel params,
  }) async {
    var response = await HttpUtil().post(
      "/address/edit",
      data: params.toJson(),
    );
    return AddressEditResponseModel.fromJson(response);
  }
}
