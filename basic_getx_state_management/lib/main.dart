import 'package:basic_getx_state_management/helper/helper_binding.dart';
import 'package:basic_getx_state_management/page/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/helper_controller.dart' as helper;

void main() async {
  // init all resources you want to init before ui print, such as some controller
  // WidgetsFlutterBinding.ensureInitialized();
  // await helper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // or you can init controller and resources use Binding
      initialBinding: InitDependencies(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
