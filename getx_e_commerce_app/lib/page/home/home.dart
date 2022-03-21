import 'package:flutter/material.dart';
import 'package:getx_e_commerce_app/common/utils/colors.dart';
import 'package:getx_e_commerce_app/common/utils/dimensions.dart';
import 'package:getx_e_commerce_app/page/home/food/food.dart';
import 'package:getx_e_commerce_app/widgets/big_text.dart';
import 'package:getx_e_commerce_app/widgets/small_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopBar(),
          const FoodPage(),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.height36),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BigText(
                text: "Bangladesh",
                color: AppColors.mainColor,
              ),
              Row(
                children: [
                  SmallText(
                    text: "Narsingdi",
                    color: Colors.black54,
                  ),
                  const Icon(Icons.arrow_drop_down_rounded)
                ],
              ),
            ],
          ),
          Center(
            child: Container(
              width: Dimensions.height42,
              height: Dimensions.height42,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius8),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: Dimensions.iconSize24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
