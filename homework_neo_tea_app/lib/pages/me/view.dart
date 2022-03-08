import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/utils/util_screen.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';
import 'package:homework_neo_tea_app/pages/me/controller.dart';

class MePage extends GetView<MePageController> {
  @override
  Widget build(BuildContext context) {
    final Size size = getScreenSize(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.secondPrimaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.06),
            _buildTopPanel(size),
            SizedBox(height: size.height * 0.04),
            _buildBottomPanel(size),
          ],
        ),
      ),
    );
  }

  _buildTopPanel(Size size) {
    return Container(
      width: size.width * 0.84,
      decoration: BoxDecoration(
        color: AppColors.subThemeWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.06,
        vertical: size.height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height * 0.16,
            width: size.width * 0.36,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "me_top_name_title".tr,
                  style: TextStyle(color: AppColors.subPageBackgroundColor),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  "Carmen Velasco",
                  maxLines: 1,
                  style: TextStyle(
                    color: AppColors.themeBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 64.0,
            backgroundImage: NetworkImage(
              "https://th.bing.com/th/id/R27342ee6774d2cb649145d6e3d6e0562?rik=ZX5j2eWziu2MFw&pid=ImgRaw",
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomPanel(Size size) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.pageBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.08),
            Container(
              width: size.width * 0.72,
              child: ElevatedButton.icon(
                onPressed: controller.handleExit,
                icon: Icon(Icons.exit_to_app_rounded),
                label: Text("me_sign_out".tr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
