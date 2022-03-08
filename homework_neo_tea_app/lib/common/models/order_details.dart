// 历史订单详情响应
class OrderHistoryListDetailsResponseModel {
  OrderHistoryListDetailsResponseModel({
    this.code,
    this.message,
    this.result,
  });

  int? code;
  String? message;
  Result? result;

  factory OrderHistoryListDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderHistoryListDetailsResponseModel(
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
    this.orderStatus,
    this.orderNo,
    this.goodsList,
    this.handleTime,
    this.finishTime,
    this.address,
    this.receiver,
    this.latitude,
    this.longitude,
    this.phone,
    this.remark,
    this.totalPrice,
  });

  int? id;
  bool? isDelete;
  DateTime? createTime;
  DateTime? updateTime;
  int? orderStatus;
  String? orderNo;
  List<GoodsList>? goodsList;
  DateTime? handleTime;
  dynamic finishTime;
  String? address;
  String? receiver;
  double? latitude;
  double? longitude;
  String? phone;
  String? remark;
  int? totalPrice;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        isDelete: json["isDelete"],
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
        orderStatus: json["orderStatus"],
        orderNo: json["orderNo"],
        goodsList: List<GoodsList>.from(
            json["goodsList"].map((x) => GoodsList.fromJson(x))),
        handleTime: DateTime.parse(json["handleTime"]),
        finishTime: json["finishTime"],
        address: json["address"],
        receiver: json["receiver"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        phone: json["phone"],
        remark: json["remark"],
        totalPrice: json["totalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isDelete": isDelete,
        "createTime": createTime!.toIso8601String(),
        "updateTime": updateTime!.toIso8601String(),
        "orderStatus": orderStatus,
        "orderNo": orderNo,
        "goodsList": List<dynamic>.from(goodsList!.map((x) => x.toJson())),
        "handleTime": handleTime!.toIso8601String(),
        "finishTime": finishTime,
        "address": address,
        "receiver": receiver,
        "latitude": latitude,
        "longitude": longitude,
        "phone": phone,
        "remark": remark,
        "totalPrice": totalPrice,
      };
}

class GoodsList {
  GoodsList({
    this.id,
    this.isDelete,
    this.createTime,
    this.updateTime,
    this.goodsName,
    this.goodsImgUrl,
    this.buyNum,
    this.thumbsUp,
    this.unitPrice,
  });

  int? id;
  bool? isDelete;
  DateTime? createTime;
  DateTime? updateTime;
  String? goodsName;
  String? goodsImgUrl;
  int? buyNum;
  int? thumbsUp;
  int? unitPrice;

  factory GoodsList.fromJson(Map<String, dynamic> json) => GoodsList(
        id: json["id"],
        isDelete: json["isDelete"],
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
        goodsName: json["goodsName"],
        goodsImgUrl: json["goodsImgUrl"],
        buyNum: json["buyNum"],
        thumbsUp: json["thumbsUp"],
        unitPrice: json["unitPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isDelete": isDelete,
        "createTime": createTime!.toIso8601String(),
        "updateTime": updateTime!.toIso8601String(),
        "goodsName": goodsName,
        "goodsImgUrl": goodsImgUrl,
        "buyNum": buyNum,
        "thumbsUp": thumbsUp,
        "unitPrice": unitPrice,
      };
}
