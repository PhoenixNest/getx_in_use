part of 'app_pages.dart';

abstract class AppRoutes {
  static const INITIAL = "/";

  // 登录
  static const SIGN_IN = "/login";

  // 注册
  static const SIGN_UP = "/register";

  // 应用引导页
  static const APPLICATION = "/application";

  //主页
  static const HOME = "/home";

  // 外带
  static const ORDER_TAKE_AWAY = "/order_take_away";

  // 结算
  static const ORDER_CHECK_OUT = "/order_check_out";

  // 历史订单
  static const ORDER_HISTORY = "/order_history";

  // 我的
  static const ME = "/me";

  // 地址管理
  static const ADDRESS = "/address";
}
