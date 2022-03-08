import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/apis/user.dart';
import 'package:homework_neo_tea_app/common/models/user_sign_in.dart';
import 'package:homework_neo_tea_app/common/routes/app_pages.dart';
import 'package:homework_neo_tea_app/global.dart';

class SignInPageController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  handleNavSignUp() {
    Get.toNamed(AppRoutes.SIGN_UP);
  }

  handleSignUp() {
    Get.toNamed(AppRoutes.SIGN_UP);
  }

  handleSignIn() async {
    // if (!checkStringLength(passWordController.value.text, 3)) {
    //   showToast(msg: "长度小于3位");
    //   return;
    // }

    UserLoginRequestModel params = UserLoginRequestModel(
      username: "asdasd5455",
      password: "asdasd",
    );

    UserLoginResponseModel userProfile = await UserAPI.login(
      params: params,
    );
    Global.saveUserProfile(userProfile);
    Get.offAndToNamed(AppRoutes.APPLICATION);
  }

  @override
  void dispose() {
    userNameController.dispose();
    passWordController.dispose();
    super.dispose();
  }
}
