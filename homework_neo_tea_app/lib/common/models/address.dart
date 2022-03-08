// 地址列表响应
class AddressListResponseModel {
  AddressListResponseModel({
    this.code,
    this.message,
    this.result,
  });

  int? code;
  String? message;
  List<AddressResult>? result;

  factory AddressListResponseModel.fromJson(Map<String, dynamic> json) =>
      AddressListResponseModel(
        code: json["code"],
        message: json["message"],
        result:
            List<AddressResult>.from(json["result"].map((x) => AddressResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class AddressResult {
  AddressResult({
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

  factory AddressResult.fromJson(Map<String, dynamic> json) => AddressResult(
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
