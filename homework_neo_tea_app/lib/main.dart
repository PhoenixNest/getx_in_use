import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homework_neo_tea_app/common/i18n/i18n.dart';
import 'package:homework_neo_tea_app/common/routes/app_pages.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';

import 'global.dart';

// flutter build apk
// 打包后：/build/app/outputs/apk/app-release.apk

Future<void> main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  print('Starting services ...');
  await Global().init();
  print('All services started...');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Neo_TEA',
      getPages: AppPages.routes,
      initialRoute: AppPages.iniPage,
      locale: i18nService.locale,
      translations: i18nService(),
      fallbackLocale: i18nService.fallbackLocale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
