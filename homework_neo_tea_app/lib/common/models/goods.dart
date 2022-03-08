// 商品响应
class GoodsListResponseModel {
  GoodsListResponseModel({
    this.code,
    this.message,
    this.result,
  });

  int? code;
  String? message;
  Result? result;

  factory GoodsListResponseModel.fromJson(Map<String, dynamic> json) =>
      GoodsListResponseModel(
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
    this.size,
    this.number,
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
  int? size;
  int? number;
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
        size: json["size"],
        number: json["number"],
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
        "size": size,
        "number": number,
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
    this.goodsName,
    this.price,
    this.stock,
    this.sales,
    this.imgUrl,
    this.description,
    this.categoryId,
  });

  int? id;
  bool? isDelete;
  DateTime? createTime;
  DateTime? updateTime;
  String? goodsName;
  double? price;
  int? stock;
  int? sales;
  String? imgUrl;
  String? description;
  int? categoryId;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        isDelete: json["isDelete"],
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
        goodsName: json["goodsName"],
        price: json["price"] == null ? null : json["price"],
        stock: json["stock"],
        sales: json["sales"] == null ? null : json["sales"],
        imgUrl: json["imgUrl"] == null ? null : json["imgUrl"],
        description: json["description"] == null ? null : json["description"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isDelete": isDelete,
        "createTime": createTime!.toIso8601String(),
        "updateTime": updateTime!.toIso8601String(),
        "goodsName": goodsName,
        "price": price == null ? null : price,
        "stock": stock,
        "sales": sales == null ? null : sales,
        "imgUrl": imgUrl == null ? null : imgUrl,
        "description": description == null ? null : description,
        "categoryId": categoryId,
      };
}

class Pageable {
  Pageable({
    this.sort,
    this.offset,
    this.pageSize,
    this.pageNumber,
    this.paged,
    this.unpaged,
  });

  Sort? sort;
  int? offset;
  int? pageSize;
  int? pageNumber;
  bool? paged;
  bool? unpaged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        offset: json["offset"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        paged: json["paged"],
        unpaged: json["unpaged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort!.toJson(),
        "offset": offset,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "paged": paged,
        "unpaged": unpaged,
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
