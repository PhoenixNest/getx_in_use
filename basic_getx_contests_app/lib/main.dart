import 'package:basic_getx_contests_app/page/detail/detail.dart';
import 'package:basic_getx_contests_app/page/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Default Flutter set home page style
      // chose home or initialRoute style
      // home: HomePage(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/detail", page: () => DetailPage()),
      ],
    );
  }
}
