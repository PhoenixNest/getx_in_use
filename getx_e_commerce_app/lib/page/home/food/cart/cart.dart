import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/controller/food/cart_controller.dart';
import 'package:getx_e_commerce_app/common/models/cart.dart';
import 'package:getx_e_commerce_app/common/utils/app_constants.dart';
import 'package:getx_e_commerce_app/common/utils/colors.dart';
import 'package:getx_e_commerce_app/common/utils/dimensions.dart';
import 'package:getx_e_commerce_app/page/home/home.dart';
import 'package:getx_e_commerce_app/widgets/app_icon.dart';
import 'package:getx_e_commerce_app/widgets/big_text.dart';
import 'package:getx_e_commerce_app/widgets/small_text.dart';

class FoodShoppingCartPage extends StatelessWidget {
  const FoodShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height36,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: _buildTopBar(),
          ),
          Positioned(
            top: Dimensions.height32 * 3,
            left: Dimensions.width16,
            right: Dimensions.width16,
            bottom: 0,
            child: Container(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<FoodCartController>(
                  builder: (_controller) {
                    return ListView.builder(
                      itemCount: _controller.getCartList.length,
                      itemBuilder: (_, index) {
                        CartModel model = _controller.getCartList[index];
                        return _buildListItem(model);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            //
          },
          child: AppIcon(
            icon: Icons.arrow_back_ios_rounded,
            iconSize: Dimensions.iconSize24,
            iconColor: Colors.white,
            backgroundColor: AppColors.mainColor,
          ),
        ),
        SizedBox(width: Dimensions.width32 * 5),
        GestureDetector(
          onTap: () {
            Get.to(() => HomePage());
          },
          child: AppIcon(
            icon: Icons.home_filled,
            iconSize: Dimensions.iconSize24,
            iconColor: Colors.white,
            backgroundColor: AppColors.mainColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            //
          },
          child: AppIcon(
            icon: Icons.shopping_cart,
            iconSize: Dimensions.iconSize24,
            iconColor: Colors.white,
            backgroundColor: AppColors.mainColor,
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(CartModel model) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.height64 * 2,
      margin: EdgeInsets.symmetric(vertical: Dimensions.height8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: Dimensions.height16 * 5,
            width: Dimensions.height16 * 5,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URL + AppConstants.UPLOAD_URL + model.img!,
                ),
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.radius16,
              ),
            ),
          ),
          SizedBox(width: Dimensions.width8),
          Expanded(
            child: Container(
              height: Dimensions.height16 * 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: model.name!,
                    color: Colors.black54,
                  ),
                  SmallText(text: "Spicy"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: "\$ ${model.price!.toString()}",
                        color: Colors.redAccent,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Dimensions.height8,
                          horizontal: Dimensions.width8,
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
                                // _controller.setGoodsNum(false);
                              },
                              child: Icon(
                                Icons.remove,
                                size: Dimensions.iconSize16,
                                color: AppColors.signColor,
                              ),
                            ),
                            SizedBox(width: Dimensions.width16),
                            BigText(
                              text: "0",
                            ),
                            SizedBox(width: Dimensions.width16),
                            GestureDetector(
                              onTap: () {
                                // add product
                                // _controller.setGoodsNum(true);
                              },
                              child: Icon(
                                Icons.add,
                                size: Dimensions.iconSize16,
                                color: AppColors.signColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
