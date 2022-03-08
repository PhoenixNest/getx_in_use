import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/utils/util_screen.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';
import 'package:homework_neo_tea_app/pages/welcome/controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = getScreenSize(context);
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 1.8,
              sigmaY: 1.8,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.64),
                  _buildPageTitle(),
                  SizedBox(height: size.height * 0.02),
                  _buildSubPageTitle(),
                  SizedBox(height: size.height * 0.08),
                  _buildNavButton(),
                  SizedBox(height: size.height * 0.02,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPageTitle() {
    return Text(
      'app_title'.tr,
      style: TextStyle(
        color: AppColors.mainTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
    );
  }

  _buildSubPageTitle() {
    String string = 'Not only carry milk tea, but also produce milk tea';
    return Text(
      string,
      style: TextStyle(
        color: AppColors.subTextColor,
        fontSize: 18,
      ),
    );
  }

  _buildNavButton() {
    return ElevatedButton(
      onPressed: controller.handleSimpleNavSignIn,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Text('SIGN IN'),
      ),
    );
  }
}
