import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/middlewares/route_auth.dart';
import 'package:homework_neo_tea_app/common/middlewares/route_welcome.dart';
import 'package:homework_neo_tea_app/pages/address/binding.dart';
import 'package:homework_neo_tea_app/pages/address/view.dart';
import 'package:homework_neo_tea_app/pages/application//view.dart';
import 'package:homework_neo_tea_app/pages/application/binding.dart';
import 'package:homework_neo_tea_app/pages/home/binding.dart';
import 'package:homework_neo_tea_app/pages/home/view.dart';
import 'package:homework_neo_tea_app/pages/me/binding.dart';
import 'package:homework_neo_tea_app/pages/me/view.dart';
import 'package:homework_neo_tea_app/pages/order_check_out/binding.dart';
import 'package:homework_neo_tea_app/pages/order_check_out/view.dart';
import 'package:homework_neo_tea_app/pages/order_history/binding.dart';
import 'package:homework_neo_tea_app/pages/order_history/view.dart';
import 'package:homework_neo_tea_app/pages/order_take_way/binding.dart';
import 'package:homework_neo_tea_app/pages/order_take_way/view.dart';
import 'package:homework_neo_tea_app/pages/sign_in/bindings.dart';
import 'package:homework_neo_tea_app/pages/sign_in/view.dart';
import 'package:homework_neo_tea_app/pages/sign_up/binding.dart';
import 'package:homework_neo_tea_app/pages/sign_up/view.dart';
import 'package:homework_neo_tea_app/pages/welcome/bindings.dart';
import 'package:homework_neo_tea_app/pages/welcome/view.dart';

part 'app_routes.dart';

class AppPages {
  static const iniPage = AppRoutes.INITIAL;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      binding: WelcomeBinding(),
      page: () => WelcomePage(),
      middlewares: [RouteWelcomeMiddleware(priority: 1)],
    ),
    GetPage(
        // 登录
        name: AppRoutes.SIGN_IN,
        // transition: Transition.native,
        binding: SignInPageBinding(),
        page: () => SignInPage()),
    GetPage(
        // 注册
        name: AppRoutes.SIGN_UP,
        binding: SignUpPageBinding(),
        page: () => SignUpPage()),
    GetPage(
        name: AppRoutes.APPLICATION,
        binding: ApplicationBinding(),
        middlewares: [RouteAuthMiddleware(priority: 1)],
        page: () => ApplicationPage()),
    GetPage(
        // 主页
        name: AppRoutes.HOME,
        binding: HomeBinding(),
        middlewares: [RouteAuthMiddleware(priority: 1)],
        page: () => HomePage()),
    GetPage(
        // 外带
        name: AppRoutes.ORDER_TAKE_AWAY,
        binding: OrderTakeAwayBinding(),
        middlewares: [RouteAuthMiddleware(priority: 1)],
        page: () => OrderTakeAwayPage()),
    GetPage(
        // 结算
        name: AppRoutes.ORDER_CHECK_OUT,
        binding: OrderCheckOutBinding(),
        middlewares: [RouteAuthMiddleware(priority: 1)],
        page: () => OrderCheckOutPage()),
    GetPage(
        // 历史订单
        name: AppRoutes.ORDER_HISTORY,
        binding: OrderHistoryBinding(),
        middlewares: [RouteAuthMiddleware(priority: 1)],
        page: () => OrderHistoryPage()),
    GetPage(
        // 我的
        name: AppRoutes.ME,
        binding: MeBinding(),
        middlewares: [RouteAuthMiddleware(priority: 1)],
        page: () => MePage()),
    GetPage(
        // 地址管理
        name: AppRoutes.ADDRESS,
        binding: AddressBinding(),
        middlewares: [RouteAuthMiddleware(priority: 1)],
        page: () => AddressPage()),
  ];
}
