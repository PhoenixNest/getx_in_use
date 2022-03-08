import 'package:homework_neo_tea_app/common/models/goods.dart';
import 'package:homework_neo_tea_app/common/utils/util_http.dart';
import 'package:homework_neo_tea_app/common/values/value_cache.dart';

class GoodsAPI {
  static Future<GoodsListResponseModel> fetchData({
    required int current,
    required int pageSize,
    int? categoryId,
  }) async {
    var response = await HttpUtil().get(
      "/goods/list?current=$current&pageSize=$pageSize",
      noCache: false,
      list: true,
      cacheKey: CACHE_TRENDING_LIST,
      cacheDisk: true,
    );
    return GoodsListResponseModel.fromJson(response);
  }

  static Future<GoodsListResponseModel> fetchTrendingData({
    required int current,
    required int pageSize,
    int? categoryId,
  }) async {
    var response = await HttpUtil().get(
      "/goods/list?current=$current&pageSize=$pageSize",
      noCache: false,
      list: true,
      cacheKey: CACHE_TRENDING_LIST,
      cacheDisk: true,
    );
    return GoodsListResponseModel.fromJson(response);
  }
}
