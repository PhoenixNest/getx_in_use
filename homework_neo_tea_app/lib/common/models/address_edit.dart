// 编辑地址请求
class AddressEditRequestModel {
  AddressEditRequestModel({
    this.address,
    this.receiver,
    this.phone,
    this.longitude,
    this.latitude,
  });

  String? address;
  String? receiver;
  String? phone;
  double? longitude;
  double? latitude;

  factory AddressEditRequestModel.fromJson(Map<String, dynamic> json) =>
      AddressEditRequestModel(
        address: json["address"],
        receiver: json["receiver"],
        phone: json["phone"],
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "receiver": receiver,
        "phone": phone,
        "longitude": longitude,
        "latitude": latitude,
      };
}

// 编辑地址响应
class AddressEditResponseModel {
  AddressEditResponseModel({
    this.code,
    this.message,
    this.result,
  });

  int? code;
  String? message;
  Result? result;

  factory AddressEditResponseModel.fromJson(Map<String, dynamic> json) =>
      AddressEditResponseModel(
        code: json["code"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "result": result!.toJson(),
      };
}

class Result {
  Result({
    this.id,
    this.isDelete,
    this.createTime,
    this.updateTime,
    this.address,
    this.receiver,
    this.latitude,
    this.longitude,
    this.phone,
  });

  int? id;
  bool? isDelete;
  DateTime? createTime;
  DateTime? updateTime;
  String? address;
  String? receiver;
  double? latitude;
  double? longitude;
  String? phone;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        isDelete: json["isDelete"],
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
        address: json["address"],
        receiver: json["receiver"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isDelete": isDelete,
        "createTime": createTime!.toIso8601String(),
        "updateTime": updateTime!.toIso8601String(),
        "address": address,
        "receiver": receiver,
        "latitude": latitude,
        "longitude": longitude,
        "phone": phone,
      };
}
