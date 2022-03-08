// 购物车列表响应
class ShoppingBagListResponseModel {
  ShoppingBagListResponseModel({
    this.code,
    this.message,
    this.result,
  });

  int? code;
  String? message;
  Result? result;

  factory ShoppingBagListResponseModel.fromJson(Map<String, dynamic> json) =>
      ShoppingBagListResponseModel(
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
    this.totalPrice,
    this.list,
  });

  String? totalPrice;
  List<ListElement>? list;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        totalPrice: json["totalPrice"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPrice": totalPrice,
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.isDelete,
    this.createTime,
    this.updateTime,
    this.buyNum,
    this.goodsId,
    this.goodsName,
    this.goodsImgUrl,
    this.price,
  });

  int? id;
  bool? isDelete;
  DateTime? createTime;
  DateTime? updateTime;
  int? buyNum;
  int? goodsId;
  String? goodsName;
  String? goodsImgUrl;
  double? price;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        isDelete: json["isDelete"],
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
        buyNum: json["buyNum"],
        goodsId: json["goodsId"],
        goodsName: json["goodsName"],
        goodsImgUrl: json["goodsImgUrl"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isDelete": isDelete,
        "createTime": createTime!.toIso8601String(),
        "updateTime": updateTime!.toIso8601String(),
        "buyNum": buyNum,
        "goodsId": goodsId,
        "goodsName": goodsName,
        "goodsImgUrl": goodsImgUrl,
        "price": price,
      };
}

// 编辑购物车商品请求
class ShoppingBagListEditRequestModel {
  ShoppingBagListEditRequestModel({
    this.id,
    this.buyNum,
  });

  String? id;
  int? buyNum;

  factory ShoppingBagListEditRequestModel.fromJson(Map<String, dynamic> json) =>
      ShoppingBagListEditRequestModel(
        id: json["id"],
        buyNum: json["buyNum"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "buyNum": buyNum,
      };
}

// 编辑购物车商品响应
class ShoppingBagListEditResponseModel {
  ShoppingBagListEditResponseModel({
    this.code,
    this.message,
    this.result,
  });

  int? code;
  String? message;
  dynamic result;

  factory ShoppingBagListEditResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ShoppingBagListEditResponseModel(
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

// 清空购物车响应
class ShoppingBagListRemoveAllResponseModel {
  ShoppingBagListRemoveAllResponseModel({
    this.code,
    this.message,
    this.result,
  });

  int? code;
  String? message;
  dynamic result;

  factory ShoppingBagListRemoveAllResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ShoppingBagListRemoveAllResponseModel(
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
