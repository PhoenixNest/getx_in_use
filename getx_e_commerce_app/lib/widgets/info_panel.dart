import 'package:flutter/material.dart';
import 'package:getx_e_commerce_app/common/utils/colors.dart';
import 'package:getx_e_commerce_app/common/utils/dimensions.dart';
import 'package:getx_e_commerce_app/widgets/big_text.dart';
import 'package:getx_e_commerce_app/widgets/icon_text.dart';
import 'package:getx_e_commerce_app/widgets/small_text.dart';

class FoodInfoPanel extends StatelessWidget {
  final String title;
  final double rating;
  final int sales;
  final String location;
  final double distance;
  final int time;

  const FoodInfoPanel({
    Key? key,
    required this.title,
    required this.rating,
    required this.sales,
    required this.location,
    required this.distance,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: title),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: Dimensions.height12,
                );
              }),
            ),
            SizedBox(width: Dimensions.width8),
            SmallText(text: rating.toString()),
            SizedBox(width: Dimensions.width8),
            SmallText(text: sales.toString()),
            SizedBox(width: Dimensions.width8),
            SmallText(text: "comment"),
          ],
        ),
        SizedBox(height: Dimensions.height16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconText(
              icon: Icons.circle_sharp,
              text: location,
              iconColor: AppColors.iconColor1,
            ),
            IconText(
              icon: Icons.location_on,
              text: "$distance km",
              iconColor: AppColors.mainColor,
            ),
            IconText(
              icon: Icons.access_time_rounded,
              text: "$time min",
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
