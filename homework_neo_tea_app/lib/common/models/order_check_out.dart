// 确认订单请求
class OrderCheckOutRequestModel {
  OrderCheckOutRequestModel({
    this.addressId,
    this.remark,
  });

  int? addressId;
  String? remark;

  factory OrderCheckOutRequestModel.fromJson(Map<String, dynamic> json) =>
      OrderCheckOutRequestModel(
        addressId: json["addressId"],
        remark: json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "addressId": addressId,
        "remark": remark,
      };
}

// 确认订单响应
class OrderCheckOutResponseModel {
  OrderCheckOutResponseModel({
    this.code,
    this.message,
    this.result,
  });

  int? code;
  String? message;
  dynamic result;

  factory OrderCheckOutResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderCheckOutResponseModel(
        code: json["code"],
        message: json["message"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "result": result,
      };
}
