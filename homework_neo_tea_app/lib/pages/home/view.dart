import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_neo_tea_app/common/utils/util_screen.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';
import 'package:homework_neo_tea_app/common/values/value_images.dart';
import 'package:homework_neo_tea_app/common/widgets/widget_input_field.dart';
import 'package:homework_neo_tea_app/pages/home/controller.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    print("Change To Page Home");
    final Size size = getScreenSize(context);
    return Scaffold(
      appBar: AppBar(title: _buildTop(size)),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.subPageBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              _buildTitle(size),
              SizedBox(height: size.height * 0.04),
              _buildTrendingPanel(size),
              SizedBox(height: size.height * 0.02),
              _buildBottomPanel(size),
            ],
          ),
        ),
      ),
    );
  }

  _buildTop(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: controller.handleLocation,
          label: Text("home_location".tr, style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.location_on, color: Colors.white),
        ),
        IconButton(
          onPressed: controller.handleNotification,
          icon: Icon(Icons.notifications, color: Colors.white),
        )
      ],
    );
  }

  _buildTitle(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "home_main_title".tr,
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.04),
          _buildSearchBar(),
        ],
      ),
    );
  }

  _buildTrendingPanel(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "",
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          _buildTrendingList(size),
        ],
      ),
    );
  }

  _buildSearchBar() {
    return neoInputTextField(
      hasIcons: true,
      icons: Icons.search_rounded,
      hintText: "home_search_bar_hint_text".tr,
      controller: controller.searchController,
    );
  }

  _buildTrendingList(Size size) {
    return Obx(
      () => controller.state.trendingList == null
          ? Container(
              height: size.height * 0.32,
              decoration: BoxDecoration(
                color: AppColors.whiteBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                  child: Text(
                "home_loading_text".tr,
                style: TextStyle(color: AppColors.mainTextColor),
              )),
            )
          : Container(
              height: size.height * 0.32,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.state.trendingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildTrendingListItem(size, index);
                },
              ),
            ),
    );
  }

  _buildTrendingListItem(Size size, int index) {
    return Card(
      color: AppColors.pageBackgroundColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Container(
            width: size.width * 0.56,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(ImageBed.imageURL[index]),
            ),
          ),
          Positioned(
            top: size.height * 0.18,
            child: Container(
              height: size.height * 0.24,
              width: size.width * 0.56,
              color: Colors.white12,
              padding: EdgeInsets.only(
                left: size.width * 0.04,
                right: size.width * 0.04,
                top: size.height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.state.trendingList[index].goodsName,
                    style: TextStyle(
                      color: AppColors.mainTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    "currency_units".tr +
                        controller.state.trendingList[index].price.toString(),
                    style: TextStyle(
                      color: AppColors.mainTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomPanel(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pageBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.width * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 2, width: 72, color: Colors.white),
          SizedBox(height: size.height * 0.04),
          _buildBottomWays(size),
          SizedBox(height: size.height * 0.08),
        ],
      ),
    );
  }

  _buildBottomWays(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: size.height * 0.08,
          width: size.width * 0.42,
          decoration: ShapeDecoration(
            color: AppColors.subPageBackgroundColor,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          child: TextButton.icon(
            onPressed: controller.handleHallFood,
            icon: Icon(Icons.account_balance_rounded),
            label: Text("home_ways_hall_foods".tr),
          ),
        ),
        Container(
          height: size.height * 0.08,
          width: size.width * 0.42,
          decoration: ShapeDecoration(
            color: AppColors.primaryColor,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          child: TextButton.icon(
            onPressed: controller.handleNavTakeAway,
            icon: Icon(
              Icons.shopping_bag_rounded,
              color: AppColors.themeBlackColor,
            ),
            label: Text(
              "home_ways_take_away".tr,
              style: TextStyle(
                color: AppColors.mainTextColorDark,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

neoMatrixButton({
  required Size size,
  required VoidCallback onPress,
  String text = "Button Text",
  Color textColor = AppColors.mainTextColorDark,
  IconData iconData = Icons.code,
  Color iconColor = AppColors.themeWhiteColor,
}) {
  return Container(
    height: size.height * 0.08,
    width: size.width * 0.42,
    decoration: ShapeDecoration(
      color: AppColors.primaryColor,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    child: TextButton.icon(
      onPressed: onPress,
      icon: Icon(iconData, color: iconColor),
      label: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    ),
  );
}
