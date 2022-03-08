import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:homework_neo_tea_app/common/routes/app_pages.dart';
import 'package:homework_neo_tea_app/global.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (Global.isFirstOpen == true) {
      return null;
    } else if (Global.isOffline == true) {
      return RouteSettings(name: AppRoutes.APPLICATION);
    } else {
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
