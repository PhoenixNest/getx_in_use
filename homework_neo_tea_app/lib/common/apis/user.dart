import 'package:homework_neo_tea_app/common/models/user_sign_in.dart';
import 'package:homework_neo_tea_app/common/models/user_sign_up.dart';
import 'package:homework_neo_tea_app/common/utils/util_http.dart';

class UserAPI {
  static Future<UserLoginResponseModel> login({
    required UserLoginRequestModel params,
  }) async {
    var response = await HttpUtil().post(
      "/user/login",
      data: params.toJson(),
    );
    return UserLoginResponseModel.fromJson(response);
  }

  static Future<UserRegisterRequestModel> register({
    required UserRegisterRequestModel params,
  }) async {
    var response = await HttpUtil().post(
      "/user/register",
      data: params.toJson(),
    );
    return UserRegisterRequestModel.fromJson(response);
  }
}
