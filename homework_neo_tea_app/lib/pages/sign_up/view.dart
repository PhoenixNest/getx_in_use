import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/utils/util_screen.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';
import 'package:homework_neo_tea_app/common/widgets/widget_input_field.dart';
import 'package:homework_neo_tea_app/pages/sign_up/controller.dart';

class SignUpPage extends GetView<SignUpPageController> {
  @override
  Widget build(BuildContext context) {
    Size size = getScreenSize(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        color: AppColors.primaryColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          decoration: ShapeDecoration(
            color: AppColors.pageBackgroundColor,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(64.0),
                bottomRight: Radius.circular(64.0),
              ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.16),
              _buildTitle(),
              SizedBox(height: size.height * 0.02),
              _buildSubTitle(),
              SizedBox(height: size.height * 0.08),
              _buildUserNameArea(),
              SizedBox(height: size.height * 0.02),
              _buildPasswordArea(),
              SizedBox(height: size.height * 0.02),
              _buildRealNameArea(),
              SizedBox(height: size.height * 0.02),
              _buildPhoneArea(),
              SizedBox(height: size.height * 0.12),
              _buildSignUpButton(size),
              _buildSignInButton(size),
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Text(
      "login_sign_up_title".tr,
      style: TextStyle(
        fontSize: 26,
        color: AppColors.mainTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _buildSubTitle() {
    return Text(
      'login_sign_up_sub_title'.tr,
      style: TextStyle(
        color: AppColors.subTextColor,
      ),
    );
  }

  _buildUserNameArea() {
    return neoInputTextField(
      hasIcons: true,
      icons: Icons.account_circle,
      controller: controller.userNameController,
      keyboardType: TextInputType.text,
      hintText: "login_sign_up_hint_text_username".tr,
    );
  }

  _buildPasswordArea() {
    return neoInputTextField(
      hasIcons: true,
      icons: Icons.lock_rounded,
      controller: controller.passWordNameController,
      hintText: "login_sign_up_hint_text_password".tr,
      isPassword: true,
    );
  }

  _buildRealNameArea() {
    return neoInputTextField(
      hasIcons: true,
      icons: Icons.whatshot_rounded,
      controller: controller.realNameController,
      keyboardType: TextInputType.text,
      hintText: "login_sign_up_hint_text_real_name".tr,
    );
  }

  _buildPhoneArea() {
    return neoInputTextField(
      hasIcons: true,
      icons: Icons.smartphone_rounded,
      controller: controller.phoneController,
      keyboardType: TextInputType.phone,
      hintText: "login_sign_up_hint_text_phone".tr,
    );
  }

  _buildSignUpButton(Size size) {
    return Container(
      width: size.width * 0.72,
      child: ElevatedButton(
        child: Text("login_sign_up_text".tr),
        onPressed: controller.handleSignUp,
      ),
    );
  }

  _buildSignInButton(Size size) {
    return Container(
      width: size.width * 0.56,
      child: TextButton(
        child: Text("login_sign_up_already_have_account_text".tr),
        onPressed: controller.handleSignIn,
      ),
    );
  }
}
