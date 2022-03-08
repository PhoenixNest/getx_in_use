import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/models/goods.dart';
import 'package:homework_neo_tea_app/common/models/shopping_bag.dart';
import 'package:homework_neo_tea_app/common/utils/util_screen.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';
import 'package:homework_neo_tea_app/common/values/value_images.dart';
import 'package:homework_neo_tea_app/pages/order_take_way/controller.dart';

class OrderTakeAwayPage extends GetView<OrderTakeAwayController> {
  @override
  Widget build(BuildContext context) {
    final Size size = getScreenSize(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [_buildTopPanel(size)];
            },
            body: _buildGoodsList(size),
          ),
          _buildShoppingBag(size),
        ],
      ),
    );
  }

  _buildTopPanel(Size size) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: AppColors.themeWhiteColor),
      backgroundColor: AppColors.pageBackgroundColor,
      expandedHeight: size.height * 0.54,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: _buildTopSwiper(size),
        ),
      ),
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: AppColors.mainTextColor,
        controller: controller.tabController,
        tabs: [
          Tab(child: Text("Milk Tea")),
          Tab(child: Text("Cake")),
          Tab(child: Text("Daily Goods")),
        ],
      ),
    );
  }

  _buildTopSwiper(Size size) {
    return Container(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Image.network(
              ImageBed.imageURL[index],
              fit: BoxFit.cover,
            ),
          );
        },
        autoplay: true,
        itemCount: ImageBed.imageURL.length,
      ),
    );
  }

  _buildGoodsList(Size size) {
    return Obx(
      () => controller.state.goodsList == null
          ? Container(
              height: size.height * 0.32,
              decoration: BoxDecoration(
                color: AppColors.pageBackgroundColor,
              ),
              child: Center(
                  child: Text(
                "home_loading_text".tr,
                style: TextStyle(color: AppColors.mainTextColor),
              )),
            )
          : Container(
              color: AppColors.pageBackgroundColor,
              padding: EdgeInsets.only(bottom: size.height * 0.08),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.state.goodsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildGoodsListItem(size, index);
                },
              ),
            ),
    );
  }

  _buildGoodsListItem(Size size, int index) {
    final Content currentGoods = controller.state.goodsList[index];
    return GestureDetector(
      onTap: () {
        _handleGoodsDetailsBottomSheet(size, index, currentGoods);
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
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
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: size.width * 0.48,
                      child: OutlineButton(
                        onPressed: () {
                          controller.asyncAddShoppingGoods(
                            goodsId: currentGoods.id,
                            shoppingBagList: controller.state.shoppingBagList,
                          );

                          controller.asyncFetchShoppingBagData();
                        },
                        borderSide: BorderSide(color: AppColors.primaryColor),
                        child: Text(
                          "order_take_away_add".tr,
                          style: TextStyle(color: AppColors.mainTextColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ).paddingAll(8),
    );
  }

  _buildShoppingBag(Size size) {
    return Positioned(
      child: Container(
        height: size.height * 0.08,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.secondPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                controller.asyncFetchShoppingBagData();
                _handleShoppingBagListBottomSheet(size);
              },
              icon: Icon(
                Icons.shopping_bag_rounded,
              ),
            ),
            Obx(
              () => RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "currency_units".tr,
                      style: TextStyle(
                        color: AppColors.mainTextColorDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: controller.state.shoppingBagTotalPrice.toString(),
                      style: TextStyle(
                        color: AppColors.mainTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              "order_take_away_delivery_fees".tr +
                  "currency_units".tr +
                  0.toString(),
              style: TextStyle(
                fontSize: 12,
                color: AppColors.mainTextColorDark,
              ),
            ),
            SizedBox(
              width: size.width * 0.08,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: TextButton(
                onPressed: controller.handleCheckOut,
                child: Text(
                  "order_take_away_checkout".tr,
                  style: TextStyle(
                      color: AppColors.pageBackgroundColor, fontSize: 12),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 8),
      ),
    );
  }

  void _handleGoodsDetailsBottomSheet(
      Size size, int index, Content currentGoods) {
    Get.bottomSheet(
      Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  height: size.height * 0.32,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: NetworkImage(ImageBed.imageURL[index]),
                ),
                Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  color: AppColors.pageBackgroundColor,
                  padding: EdgeInsets.all(size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            currentGoods.goodsName.toString(),
                            style: TextStyle(
                                color: AppColors.mainTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.04),
                      Text(
                        currentGoods.description.toString(),
                        style: TextStyle(
                          color: AppColors.mainTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleShoppingBagListBottomSheet(Size size) {
    Get.bottomSheet(
      Obx(() {
        if (controller.state.shoppingBagList != null) {
          List<ListElement>? list = controller.state.shoppingBagList;
          if (list!.length == 0) {
            return Container(
              height: size.height * 0.24,
              padding: EdgeInsets.all(size.width * 0.08),
              color: AppColors.pageBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "order_take_away_empty_shopping_bag".tr,
                    style: TextStyle(color: AppColors.mainTextColor),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    label: Text("order_take_away_add_goods_now".tr),
                    icon: Icon(Icons.add),
                  )
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: AppColors.pageBackgroundColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "order_take_away_selected_goods".tr,
                            style: TextStyle(
                              color: AppColors.mainTextColor,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: controller.handleRemoveAllGoods,
                            label: Text(
                                "order_take_away_remove_all_elected_goods".tr),
                            icon: Icon(Icons.restore_from_trash_rounded),
                          ),
                        ],
                      ),
                      Divider(color: AppColors.themeWhiteColor),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.state.shoppingBagList.length,
                        itemBuilder: (BuildContext context, int index) {
                          ListElement currentGoods = list[index];
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
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
                                    image:
                                        NetworkImage(ImageBed.imageURL[index]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.04),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          currentGoods.goodsName.toString(),
                                          style: TextStyle(
                                            color: AppColors.mainTextColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: size.height * 0.02),
                                        Row(
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.justify,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "currency_units".tr,
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .mainTextColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: currentGoods.price
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ).marginOnly(right: 8),
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .asyncRemoveShoppingGoods(
                                                        goodsId: currentGoods
                                                            .goodsId,
                                                        shoppingBagList:
                                                            controller.state
                                                                .shoppingBagList,
                                                      );

                                                      controller
                                                          .asyncFetchShoppingBagData();
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color: AppColors
                                                          .mainTextColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    list[index]
                                                        .buyNum
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .mainTextColor),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .asyncAddShoppingGoods(
                                                        goodsId: currentGoods
                                                            .goodsId,
                                                        shoppingBagList:
                                                            controller.state
                                                                .shoppingBagList,
                                                      );

                                                      controller
                                                          .asyncFetchShoppingBagData();
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_up_rounded,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).marginOnly(bottom: 16);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        } else {
          return _listNoFound();
        }
      }),
    );
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
}
