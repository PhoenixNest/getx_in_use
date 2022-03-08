import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/utils/util_screen.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';
import 'package:homework_neo_tea_app/common/widgets/widget_btn_social.dart';
import 'package:homework_neo_tea_app/common/widgets/widget_input_field.dart';
import 'package:homework_neo_tea_app/common/widgets/widget_toast.dart';
import 'package:homework_neo_tea_app/pages/sign_in/controller.dart';

class SignInPage extends GetView<SignInPageController> {
  @override
  Widget build(BuildContext context) {
    final Size size = getScreenSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        color: AppColors.primaryColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          decoration: ShapeDecoration(
            color: AppColors.pageBackgroundColor,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(64.0),
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.16),
              _buildTitle(),
              SizedBox(height: size.height * 0.02),
              _buildSubTitle(),
              SizedBox(height: size.height * 0.08),
              _buildUserNameArea(),
              SizedBox(height: size.height * 0.02),
              _buildPasswordArea(),
              SizedBox(height: size.height * 0.04),
              _buildForgotPassword(),
              SizedBox(height: size.height * 0.04),
              _buildSignInButton(size),
              SizedBox(height: size.height * 0.02),
              _buildSignUpButton(size),
              SizedBox(height: size.height * 0.08),
              _buildORDivider(size),
              SizedBox(height: size.height * 0.04),
              _buildSocialWays(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Text(
      'login_title'.tr,
      style: TextStyle(
        fontSize: 26,
        color: AppColors.mainTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _buildSubTitle() {
    return Text(
      'login_sub_title'.tr,
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
      hintText: "login_hint_sign_in_text_username".tr,
    );
  }

  _buildPasswordArea() {
    return neoInputTextField(
      hasIcons: true,
      icons: Icons.lock_rounded,
      controller: controller.passWordController,
      hintText: "login_hint_sign_in_text_password".tr,
      isPassword: true,
    );
  }

  _buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
        "login_forgot_label".tr,
        style: TextStyle(color: AppColors.subTextColor),
      ),
    );
  }

  _buildSignInButton(Size size) {
    return Container(
      width: size.width * 0.72,
      child: ElevatedButton(
        child: Text("login_sign_in_text".tr),
        onPressed: controller.handleSignIn,
      ),
    );
  }

  _buildSignUpButton(Size size) {
    return Container(
      width: size.width * 0.56,
      child: TextButton(
        child: Text("login_sign_in_dont_have_account_text".tr),
        onPressed: controller.handleSignUp,
      ),
    );
  }

  _buildORDivider(Size size) {
    return Container(
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          Expanded(child: Divider(color: Colors.white)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "OR",
              style: TextStyle(color: AppColors.mainTextColor),
            ),
          ),
          Expanded(child: Divider(color: Colors.white)),
        ],
      ),
    );
  }

  _buildSocialWays() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          neoSocialButton(
            color: AppColors.whiteBackgroundColor,
            icon: "assets/icons/QQ.svg",
            press: () {
              showToast(msg: "QQ");
            },
          ),

          /// WeChat
          neoSocialButton(
            color: AppColors.whiteBackgroundColor,
            icon: "assets/icons/WeChat.svg",
            press: () {
              showToast(msg: 'WeChat');
            },
          ),

          /// Alibaba
          neoSocialButton(
            color: AppColors.whiteBackgroundColor,
            icon: "assets/icons/Alibaba.svg",
            press: () {
              showToast(msg: "Alibaba");
            },
          ),
        ],
      ),
    );
  }
}
