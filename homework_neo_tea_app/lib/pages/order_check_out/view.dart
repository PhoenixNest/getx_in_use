import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/models/shopping_bag.dart';
import 'package:homework_neo_tea_app/common/utils/util_screen.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';
import 'package:homework_neo_tea_app/common/values/value_images.dart';
import 'package:homework_neo_tea_app/pages/order_check_out/controller.dart';

class OrderCheckOutPage extends GetView<OrderCheckOutController> {
  @override
  Widget build(BuildContext context) {
    Size size = getScreenSize(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.themeWhiteColor),
        title: Text(
          "order_check_out_app_bar_title".tr,
          style: TextStyle(color: AppColors.mainTextColor),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildOrderDetailsList(size),
          _buildCheckButton(size),
        ],
      ),
    );
  }

  _buildAddressPanel(Size size) {
    return Obx(() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "order_check_out_address_title".tr,
              style: TextStyle(color: AppColors.mainTextColor, fontSize: 18),
            ),
            Divider(color: AppColors.mainTextColor),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.72,
                      padding: EdgeInsets.all(size.width * 0.02),
                      decoration: BoxDecoration(
                        color: AppColors.secondPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: controller.state.addressList == null
                          ? Text("order_check_out_check_address_not_found".tr)
                          : Text(
                              controller.state.addressList[0].address,
                              style: TextStyle(color: AppColors.mainTextColor),
                            ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "order_check_out_check_address_label".tr,
                        style: TextStyle(color: AppColors.mainTextColor),
                      ),
                      icon: Icon(
                        Icons.arrow_circle_up_rounded,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: controller.handleNavMap,
                  icon: Icon(
                    Icons.location_on_rounded,
                    color: AppColors.secondPrimaryColor,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }).marginSymmetric(
      horizontal: size.width * 0.04,
      vertical: size.height * 0.02,
    );
  }

  _buildSubTitle(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.02,
      ),
      child: Text(
        "order_check_out_goods_details_title".tr,
        style: TextStyle(color: AppColors.mainTextColor, fontSize: 20),
      ),
    );
  }

  _buildShoppingBagList(Size size) {
    return Obx(() {
      if (controller.state.shoppingBagList == null) {
        return _listNoFound();
      } else {
        List<ListElement>? list = controller.state.shoppingBagList;
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            color: AppColors.pageBackgroundColor,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.state.shoppingBagList.length,
              itemBuilder: (BuildContext context, int index) {
                ListElement currentGoods = list![index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    color: AppColors.subPageBackgroundColor,
                    child: Row(
                      children: [
                        Image(
                          width: size.width * 0.36,
                          height: 128,
                          fit: BoxFit.cover,
                          image: NetworkImage(ImageBed.imageURL[index]),
                        ),
                        Container(
                          height: 96,
                          width: size.width * 0.36,
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentGoods.goodsName.toString(),
                                style: TextStyle(
                                  color: AppColors.mainTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "currency_units".tr,
                                      style: TextStyle(
                                        color: AppColors.mainTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: currentGoods.price.toString(),
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ).marginOnly(right: 8),
                              Spacer(),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "x",
                                      style: TextStyle(
                                        color: AppColors.mainTextColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: currentGoods.buyNum.toString(),
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ).marginOnly(right: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ).marginOnly(bottom: 16);
              },
            ),
          ),
        );
      }
    });
  }

  _listNoFound() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        color: AppColors.pageBackgroundColor,
        width: double.infinity,
      ),
    );
  }

  _buildOrderDetailsList(Size size) {
    return Container(
      width: double.infinity,
      height: size.height,
      color: AppColors.pageBackgroundColor,
      padding: EdgeInsets.only(bottom: size.height * 0.08),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddressPanel(size),
            Divider(color: AppColors.mainTextColor),
            _buildSubTitle(size),
            _buildShoppingBagList(size),
          ],
        ),
      ),
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
        onPressed: controller.handleCheckOut,
        icon: Icon(
          Icons.check_circle_rounded,
          color: AppColors.mainTextColorDark,
        ),
        label: Text(
          "order_check_out_button_label".tr,
          style: TextStyle(
            color: AppColors.mainTextColorDark,
          ),
        ),
      ),
    );
  }
}
