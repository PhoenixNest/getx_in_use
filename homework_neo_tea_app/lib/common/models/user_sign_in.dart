// 登录请求
class UserLoginRequestModel {
  UserLoginRequestModel({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory UserLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

// 登录响应
class UserLoginResponseModel {
  UserLoginResponseModel({
    this.code,
    this.msg,
    this.data,
  });

  int? code;
  String? msg;
  Data? data;

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseModel(
        code: json["code"],
        msg: json["msg"],
        data: Data.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "result": data!.toJson(),
      };
}

class Data {
  Data({
    this.token,
  });

  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
