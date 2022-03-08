import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/models/goods.dart';

class HomeState {
  // 当下流行，默认 6 个
  final _trendingList = Rx<List<Content>?>(null);

  set trendingList(value) => _trendingList.value = value;

  get trendingList => _trendingList.value;
}
