import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/i18n/en_US.dart';
import 'package:homework_neo_tea_app/common/i18n/zh_CN.dart';

class i18nService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale("en", "US");

  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": en_US,
        "zh_CN": zh_CN,
      };
}
