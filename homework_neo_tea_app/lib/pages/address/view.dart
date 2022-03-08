import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/models/address.dart';
import 'package:homework_neo_tea_app/common/utils/util_screen.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';
import 'package:homework_neo_tea_app/pages/address/controller.dart';

class AddressPage extends GetView<AddressPageController> {
  @override
  Widget build(BuildContext context) {
    Size size = getScreenSize(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.themeWhiteColor),
        title: Text("address_app_bar_title".tr,
            style: TextStyle(color: AppColors.mainTextColor)),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildMainList(size),
          _buildCheckButton(size),
        ],
      ),
    );
  }

  _buildMainList(Size size) {
    return Container(
      child: Obx(() {
        if (controller.state.addressList == null) {
          return Container(
            color: AppColors.pageBackgroundColor,
            width: double.infinity,
            height: size.height,
          );
        } else {
          List<AddressResult> list = controller.state.addressList;
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: size.height,
              color: AppColors.pageBackgroundColor,
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      AddressResult address = list[index];
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.subPageBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(width: size.width * 0.04),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  address.address.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  "address_receiver_leading".tr +
                                      address.receiver.toString(),
                                  style: TextStyle(
                                    color: AppColors.mainTextColor,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.02),
                                Text(
                                  "" + address.phone.toString(),
                                  style: TextStyle(
                                    color: AppColors.mainTextColor,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: AppColors.themeWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  _buildCheckButton(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: AppColors.secondPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: TextButton.icon(
        onPressed: controller.handleAddAddress,
        icon: Icon(
          Icons.add,
          color: AppColors.mainTextColorDark,
        ),
        label: Text(
          "address_add_button_label".tr,
          style: TextStyle(
            color: AppColors.mainTextColorDark,
          ),
        ),
      ),
    );
  }
}
