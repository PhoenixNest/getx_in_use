import 'package:basic_getx_state_management/controller/tap_controller.dart';
import 'package:basic_getx_state_management/page/first_page/first_page.dart';
import 'package:basic_getx_state_management/page/second_page/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // in GetX, controller initialization will only be process once time
    // you can use Get.find() to find and access this controller which name is same of TapController
    final TapController controller = Get.find<TapController>();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // use GetBuilder to access controller
            // you must tell GetX which controller you will use all the time in <> tags
            GetBuilder<TapController>(
              builder: (_) {
                return Container(
                  width: double.maxFinite,
                  height: 72,
                  margin: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: const Color(0xFF89dad0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      // access controller value
                      controller.x.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                controller.increaseX();
              },
              child: Container(
                width: double.maxFinite,
                height: 72,
                margin: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFF89dad0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    "increase X",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // GetX route
                // route to another page
                Get.to(() => FirstPage());
              },
              child: Container(
                width: double.maxFinite,
                height: 72,
                margin: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFF89dad0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    "Go to first page",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => SecondPage());
              },
              child: Container(
                width: double.maxFinite,
                height: 72,
                margin: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFF89dad0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    "Go to second page",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //
              },
              child: Container(
                width: double.maxFinite,
                height: 72,
                margin: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFF89dad0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    "tap",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
