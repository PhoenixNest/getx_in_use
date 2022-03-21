import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/controller/food/cart_controller.dart';
import 'package:getx_e_commerce_app/common/controller/food/popular_controller.dart';
import 'package:getx_e_commerce_app/common/controller/food/recommend_controller.dart';
import 'package:getx_e_commerce_app/common/helper/routes.dart';
import 'package:getx_e_commerce_app/common/models/goods.dart';
import 'package:getx_e_commerce_app/common/utils/app_constants.dart';
import 'package:getx_e_commerce_app/common/utils/colors.dart';
import 'package:getx_e_commerce_app/common/utils/dimensions.dart';
import 'package:getx_e_commerce_app/page/home/food/cart/cart.dart';
import 'package:getx_e_commerce_app/widgets/app_icon.dart';
import 'package:getx_e_commerce_app/widgets/big_text.dart';
import 'package:getx_e_commerce_app/widgets/expandable_text.dart';

class FoodRecommendDetailsPage extends StatelessWidget {
  final int pageId;

  const FoodRecommendDetailsPage({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodRecommendController controller = Get.find<FoodRecommendController>();
    FoodCartController cartController = Get.find<FoodCartController>();

    GoodsModel goods = controller.recommendGoodsList[pageId];
    Get.find<FoodPopularController>().initShoppingCart(goods, cartController);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // disabled the default <- back button
            automaticallyImplyLeading: false,
            toolbarHeight: 72,
            title: _buildTopBar(),
            bottom: _buildTitleText(title: goods.name!),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: _buildBackgroundImage(imgUrl: goods.img!),
          ),
          SliverToBoxAdapter(
            child: _buildPageBody(description: goods.description!),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<FoodPopularController>(
        builder: (_controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height16,
                  horizontal: Dimensions.width32,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // remove current goods in cart
                        _controller.setGoodsNum(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                        backgroundColor: AppColors.mainColor,
                      ),
                    ),
                    BigText(
                      size: Dimensions.fontSize24,
                      text:
                          "\$ ${goods.price}  X  ${_controller.inCartGoodsNum}",
                      color: AppColors.mainBlackColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        // add current goods to cart
                        _controller.setGoodsNum(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                        backgroundColor: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                    Container(
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.addGoodsToCart(goods);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Dimensions.height16,
                          horizontal: Dimensions.width16,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.height16),
                        ),
                        child: BigText(
                          text: "\$ ${goods.price!} | Add to chart",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.initialHomePage);
          },
          child: const AppIcon(
            icon: Icons.clear,
            backgroundColor: Colors.white54,
          ),
        ),
        GetBuilder<FoodCartController>(
          builder: (_controller) {
            return GestureDetector(
              onTap: () {
                //
              },
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => FoodShoppingCartPage());
                    },
                    child: const AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      backgroundColor: Colors.white54,
                    ),
                  ),

                  // badge background
                  Get.find<FoodPopularController>().totalGoodsNum >= 1
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: AppIcon(
                            icon: Icons.circle,
                            size: 16,
                            iconColor: Colors.transparent,
                            backgroundColor: AppColors.mainColor,
                          ),
                        )
                      : Container(),

                  // badge text
                  Get.find<FoodPopularController>().totalGoodsNum >= 1
                      ? Positioned(
                          top: 2,
                          right: 2,
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
    );
  }

  PreferredSize _buildTitleText({required String title}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(20),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: Dimensions.height12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius16),
          ),
        ),
        child: Center(
          child: BigText(
            text: title,
            size: Dimensions.fontSize24,
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage({required String imgUrl}) {
    return FlexibleSpaceBar(
      background: Image.network(
        AppConstants.BASE_URL + AppConstants.UPLOAD_URL + imgUrl,
        width: double.maxFinite,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPageBody({required String description}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width16),
          child: ExpandableText(
            text: description,
          ),
        ),
      ],
    );
  }
}
