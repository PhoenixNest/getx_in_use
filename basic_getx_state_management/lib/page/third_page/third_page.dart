import 'package:basic_getx_state_management/controller/list_controller.dart';
import 'package:basic_getx_state_management/controller/tap_controller.dart';
import 'package:basic_getx_state_management/page/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // access another controller anywhere, by it will init only once time
    // ListController listController = Get.put(ListController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // go to home page
            Get.to(() => HomePage());
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 72,
                      margin: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: const Color(0xFF89dad0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          // you can also access the value to use this style
                          "X value: " + Get.find<TapController>().x.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 72,
                      margin: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: const Color(0xFF89dad0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Y value: " +
                              Get.find<TapController>().y.value.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 72,
                      margin: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: const Color(0xFF89dad0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Total value: " +
                              Get.find<TapController>().z.value.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.find<TapController>().increaseY();
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
                      "increase Y",
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
                  Get.find<TapController>().totalXY();
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
                      "calculate x+y",
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
                  Get.find<ListController>()
                      .setVallue(Get.find<TapController>().z.value);
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
                      "add value to list",
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
      ),
    );
  }
}
