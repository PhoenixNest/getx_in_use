/// 注册请求
class UserRegisterRequestModel {
  UserRegisterRequestModel({
    required this.username,
    required this.password,
    required this.gender,
    required this.realName,
    required this.phone,
  });

  String username;
  String password;
  String gender;
  String realName;
  String phone;

  factory UserRegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterRequestModel(
        username: json["username"],
        password: json["password"],
        gender: json["gender"],
        realName: json["realName"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "gender": gender,
        "realName": realName,
        "phone": phone,
      };
}

/// 注册响应
class UserRegisterResponseModel {
  UserRegisterResponseModel({
    this.msg,
  });

  String? msg;

  factory UserRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterResponseModel(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
