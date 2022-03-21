import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/controller/food/cart_controller.dart';
import 'package:getx_e_commerce_app/common/controller/food/popular_controller.dart';
import 'package:getx_e_commerce_app/common/helper/routes.dart';
import 'package:getx_e_commerce_app/common/models/goods.dart';
import 'package:getx_e_commerce_app/common/utils/app_constants.dart';
import 'package:getx_e_commerce_app/common/utils/colors.dart';
import 'package:getx_e_commerce_app/common/utils/dimensions.dart';
import 'package:getx_e_commerce_app/page/home/food/cart/cart.dart';
import 'package:getx_e_commerce_app/widgets/app_icon.dart';
import 'package:getx_e_commerce_app/widgets/big_text.dart';
import 'package:getx_e_commerce_app/widgets/expandable_text.dart';
import 'package:getx_e_commerce_app/widgets/info_panel.dart';

class FoodPopularDetailPage extends StatelessWidget {
  final int pageId;

  const FoodPopularDetailPage({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodPopularController controller = Get.find<FoodPopularController>();
    FoodCartController cartController = Get.find<FoodCartController>();

    GoodsModel goods = controller.popularGoodsList[pageId];
    controller.initShoppingCart(goods, cartController);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundImage(goods.img!),
          _buildTopBar(),
          _buildGoodsInfo(
            title: goods.name!,
            description: goods.description!,
            rating: 5.0,
            sales: 1287,
            location: goods.location!,
            distance: 1.7,
            time: 32,
          ),
          // _buildFoodDetail(),
        ],
      ),

      // Bottom bar
      bottomNavigationBar: Container(
        height: Dimensions.detailBottomBar120,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.height16,
          horizontal: Dimensions.width16,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius16 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<FoodPopularController>(
              builder: (_controller) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height16,
                    horizontal: Dimensions.width16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius16,
                    ),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // remove product
                          _controller.setGoodsNum(false);
                        },
                        child: Icon(Icons.remove, color: AppColors.signColor),
                      ),
                      SizedBox(width: Dimensions.width16),
                      BigText(
                        text: _controller.inCartGoodsNum.toString(),
                      ),
                      SizedBox(width: Dimensions.width16),
                      GestureDetector(
                        onTap: () {
                          // add product
                          _controller.setGoodsNum(true);
                        },
                        child: Icon(Icons.add, color: AppColors.signColor),
                      ),
                    ],
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                controller.addGoodsToCart(goods);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height16,
                  horizontal: Dimensions.width16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.height16),
                ),
                child: BigText(
                  text: "\$ ${goods.price} | Add to cart",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(String imgUrl) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: double.maxFinite,
        height: Dimensions.detailBackgroundImage320,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              AppConstants.BASE_URL + AppConstants.UPLOAD_URL + imgUrl,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Positioned(
      top: Dimensions.height36,
      left: Dimensions.width16,
      right: Dimensions.width16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.initialHomePage);
            },
            child: const AppIcon(
              icon: Icons.arrow_back_ios_rounded,
              backgroundColor: Colors.white54,
            ),
          ),
          GetBuilder<FoodCartController>(
            builder: (_controller) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => FoodShoppingCartPage());
                },
                child: Stack(
                  children: [
                    const AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      backgroundColor: Colors.white54,
                    ),

                    // badge background
                    Get.find<FoodPopularController>().totalGoodsNum >= 1
                        ? Positioned(
                            top: 0,
                            right: 0,
                            child: AppIcon(
                              icon: Icons.circle,
                              size: 20,
                              iconColor: Colors.transparent,
                              backgroundColor: AppColors.mainColor,
                            ),
                          )
                        : Container(),

                    // badge text
                    Get.find<FoodPopularController>().totalGoodsNum >= 1
                        ? Positioned(
                            top: 4,
                            right: 4,
                            child: BigText(
                                size: 12,
                                color: Colors.white,
                                text: Get.find<FoodPopularController>()
                                    .totalGoodsNum
                                    .toString()),
                          )
                        : Container(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGoodsInfo({
    required String title,
    required String description,
    required double rating,
    required int sales,
    required String location,
    required double distance,
    required int time,
  }) {
    return Positioned(
      top: Dimensions.detailBackgroundImage320 - 20,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.height16,
          horizontal: Dimensions.width16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodInfoPanel(
              title: title,
              rating: rating,
              sales: sales,
              location: location,
              distance: distance,
              time: time,
            ),
            SizedBox(height: Dimensions.height16),
            BigText(text: "Introduce"),
            SizedBox(height: Dimensions.height16),
            Expanded(
              child: SingleChildScrollView(
                child: ExpandableText(
                  text: description,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
