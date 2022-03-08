import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/models/order.dart';
import 'package:homework_neo_tea_app/common/utils/util_screen.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';
import 'package:homework_neo_tea_app/common/values/value_images.dart';
import 'package:homework_neo_tea_app/pages/order_history/controller.dart';

class OrderHistoryPage extends GetView<OrderHistoryPageController> {
  @override
  Widget build(BuildContext context) {
    print("Change To Page Order");

    Size size = getScreenSize(context);
    return Scaffold(
      appBar: AppBar(
        title: _buildTopPanel(size),
        backgroundColor: AppColors.subPageBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.pageBackgroundColor,
          child: _buildOrderHistoryList(size),
        ),
      ),
    );
  }

  _buildTopPanel(Size size) {
    return Container(
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "History",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "Box",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.filter_list_rounded, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildOrderHistoryList(Size size) {
    return Obx(() {
      if (controller.state.orderHistoryList != null) {
        List<Content> list = controller.state.orderHistoryList;
        return Container(
          child: ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              Content currentOrder = list[index];
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                  vertical: size.height * 0.02,
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.28,
                          child: Text(
                            currentOrder.createTime.toString(),
                            softWrap: true,
                            maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.mainTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.02),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            "order_history_take_away_label".tr,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "order_history_status".tr,
                          style: TextStyle(color: AppColors.mainTextColor),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Divider(color: AppColors.themeWhiteColor),
                    SizedBox(height: size.height * 0.02),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: currentOrder.goodsList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image(
                                    width: 96,
                                    height: 96,
                                    image:
                                        NetworkImage(ImageBed.imageURL[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: size.width * 0.04),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: size.height * 0.02),
                                    Text(
                                      currentOrder.goodsList![index].goodsName
                                          .toString(),
                                      style: TextStyle(
                                          color: AppColors.primaryColor),
                                    ),
                                    SizedBox(height: size.height * 0.02),
                                    Text(
                                      "x" +
                                          currentOrder.goodsList![index].buyNum
                                              .toString(),
                                      style: TextStyle(
                                          color: AppColors.mainTextColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                    SizedBox(height: size.height * 0.02),
                    Divider(color: AppColors.themeWhiteColor),
                    SizedBox(height: size.height * 0.02),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "order_history_total_price".tr,
                            style: TextStyle(
                              color: AppColors.mainTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "currency_units".tr,
                            style: TextStyle(
                              color: AppColors.mainTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: currentOrder.totalPrice.toString(),
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      } else {
        return _listNoFound(size);
      }
    });
  }

  _listNoFound(Size size) {
    return Container(
      width: double.infinity,
      height: size.height - size.height * 0.18,
      color: AppColors.pageBackgroundColor,
      child: Center(
          child: Text(
        "order_history_list_empty_or_not_found".tr,
        style: TextStyle(
          fontSize: 24,
          color: AppColors.mainTextColor,
        ),
      )),
    );
  }
}
