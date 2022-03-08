import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController {
  SignUpPageController();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passWordNameController = TextEditingController();
  final TextEditingController realNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  handleSignUp() {}

  handleSignIn(){
    Get.back();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passWordNameController.dispose();
    realNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
