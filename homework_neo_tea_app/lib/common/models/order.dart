// 历史订单响应
class OrderHistoryListResponseModel {
  OrderHistoryListResponseModel({
    this.code,
    this.message,
    this.result,
  });

  int? code;
  String? message;
  Result? result;

  factory OrderHistoryListResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderHistoryListResponseModel(
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
    this.content,
    this.pageable,
    this.last,
    this.totalPages,
    this.totalElements,
    this.number,
    this.size,
    this.sort,
    this.numberOfElements,
    this.first,
    this.empty,
  });

  List<Content>? content;
  Pageable? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  int? number;
  int? size;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  bool? empty;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        number: json["number"],
        size: json["size"],
        sort: Sort.fromJson(json["sort"]),
        numberOfElements: json["numberOfElements"],
        first: json["first"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content!.map((x) => x.toJson())),
        "pageable": pageable!.toJson(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "number": number,
        "size": size,
        "sort": sort!.toJson(),
        "numberOfElements": numberOfElements,
        "first": first,
        "empty": empty,
      };
}

class Content {
  Content({
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
  dynamic handleTime;
  dynamic finishTime;
  String? address;
  String? receiver;
  double? latitude;
  double? longitude;
  String? phone;
  String? remark;
  double? totalPrice;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        isDelete: json["isDelete"],
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
        orderStatus: json["orderStatus"],
        orderNo: json["orderNo"],
        goodsList: List<GoodsList>.from(
            json["goodsList"].map((x) => GoodsList.fromJson(x))),
        handleTime: json["handleTime"],
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
        "handleTime": handleTime,
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
  double? unitPrice;

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

class Pageable {
  Pageable({
    this.sort,
    this.offset,
    this.pageNumber,
    this.pageSize,
    this.unpaged,
    this.paged,
  });

  Sort? sort;
  int? offset;
  int? pageNumber;
  int? pageSize;
  bool? unpaged;
  bool? paged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        offset: json["offset"],
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        unpaged: json["unpaged"],
        paged: json["paged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort!.toJson(),
        "offset": offset,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "unpaged": unpaged,
        "paged": paged,
      };
}

class Sort {
  Sort({
    this.sorted,
    this.unsorted,
    this.empty,
  });

  bool? sorted;
  bool? unsorted;
  bool? empty;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        unsorted: json["unsorted"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
      };
}
