import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/controller/food/popular_controller.dart';
import 'package:getx_e_commerce_app/common/controller/food/recommend_controller.dart';
import 'package:getx_e_commerce_app/common/helper/routes.dart';
import 'package:getx_e_commerce_app/common/models/goods.dart';
import 'package:getx_e_commerce_app/common/utils/app_constants.dart';
import 'package:getx_e_commerce_app/common/utils/colors.dart';
import 'package:getx_e_commerce_app/common/utils/dimensions.dart';
import 'package:getx_e_commerce_app/widgets/big_text.dart';
import 'package:getx_e_commerce_app/widgets/icon_text.dart';
import 'package:getx_e_commerce_app/widgets/info_panel.dart';
import 'package:getx_e_commerce_app/widgets/small_text.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8; // original size
  final double _itemHeight = Dimensions.foodPageViewImage220;

  PageController pageController = PageController(viewportFraction: 0.72);

  @override
  void initState() {
    super.initState();
    // add pageListener that can access page index or other usage
    pageController.addListener(() {
      setState(() {
        // track current page to next page value
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildPageView(),
            _buildPageViewIndicator(),
            SizedBox(height: Dimensions.height32),
            _buildRecommendTitle(),
            _buildRecommendList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return GetBuilder<FoodPopularController>(
      builder: (_controller) {
        final length = _controller.popularGoodsList.length;
        return _controller.isLoaded
            ? Container(
                height: Dimensions.foodPageView320,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: length,
                  itemBuilder: (context, index) {
                    return _buildPageViewItem(
                      index,
                      _controller.popularGoodsList[index],
                    );
                  },
                ),
              )
            : const CircularProgressIndicator(color: Colors.white);
      },
    );
  }

  Widget _buildPageViewItem(int index, GoodsModel model) {
    // return (x, y) coordinate
    Matrix4 matrix4 = Matrix4.identity();

    // calculate the item animation
    if (index == _currentPageValue.floor()) {
      // current item
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      // if we slide the item, make the current item become the same level as the previous or next one
      var currentTrans = _itemHeight * (1 - currentScale) / 2;
      // change the y value to make the item fit the container
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      // next item
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _itemHeight * (1 - currentScale) / 2;
      // change the scale into 0.8 that makes the item become small
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      // previous item
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _itemHeight * (1 - currentScale) / 2;
      // change the scale into 0.8 that makes the item become small
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      // fix the card which not correct to its height
      var currentScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _itemHeight * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix4,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.getPopularFoodPage(index));
        },
        child: Stack(
          children: [
            _buildPageItemImage(model.img!),
            _buildPageItemInfo(
              title: model.name!,
              rating: 5.0,
              sales: 1287,
              location: "Normal",
              distance: 1.7,
              time: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageItemImage(String imgUrl) {
    return Container(
      height: Dimensions.foodPageViewImage220,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(Dimensions.radius24),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              AppConstants.BASE_URL + AppConstants.UPLOAD_URL + imgUrl),
        ),
      ),
    );
  }

  Widget _buildPageItemInfo({
    required String title,
    required double rating,
    required int sales,
    required String location,
    required double distance,
    required int time,
  }) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Dimensions.foodPageViewText120,
        margin: EdgeInsets.symmetric(
          vertical: Dimensions.height24,
          horizontal: Dimensions.width24,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius24),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFe8e8e8),
              // shadow opacity
              blurRadius: 6.0,
              // make the shadow settle down with 6 pixels to its x and y axis
              offset: Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-6, 0),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(6, 0),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(Dimensions.height16),
          child: FoodInfoPanel(
            title: title,
            rating: rating,
            sales: sales,
            location: location,
            distance: distance,
            time: time,
          ),
        ),
      ),
    );
  }

  Widget _buildPageViewIndicator() {
    return GetBuilder<FoodPopularController>(
      builder: (_controller) {
        return DotsIndicator(
          dotsCount: _controller.popularGoodsList.isEmpty
              ? 1
              : _controller.popularGoodsList.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecommendTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BigText(text: "Recommend"),
          SizedBox(width: Dimensions.width10),
          BigText(text: ".", color: Colors.black26),
          SizedBox(width: Dimensions.width8),
          SmallText(text: "Food pairing"),
        ],
      ),
    );
  }

  Widget _buildRecommendList() {
    return GetBuilder<FoodRecommendController>(
      builder: (_controller) {
        final length = _controller.recommendGoodsList.length;
        return _controller.isLoaded
            ? ListView.builder(
                itemCount: length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildListItem(
                    index,
                    _controller.recommendGoodsList[index],
                  );
                },
              )
            : CircularProgressIndicator(color: AppColors.mainColor);
      },
    );
  }

  Widget _buildListItem(int index, GoodsModel product) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.getRecommendFoodPage(index));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.width16,
          vertical: Dimensions.height10,
        ),
        child: Row(
          children: [
            _buildListItemImage(product.img!),
            _buildListItemInfo(
              title: product.name!,
              subTitle: "subTitle",
              location: "Normal",
              distance: 1.7,
              time: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItemImage(String imgUrl) {
    return Container(
      width: Dimensions.foodListViewImage120,
      height: Dimensions.foodListViewImage120,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              AppConstants.BASE_URL + AppConstants.UPLOAD_URL + imgUrl),
        ),
      ),
    );
  }

  Widget _buildListItemInfo({
    required String title,
    required String subTitle,
    required String location,
    required double distance,
    required int time,
  }) {
    return Expanded(
      child: Container(
        height: Dimensions.foodListViewText100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(Dimensions.radius20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.height8,
            horizontal: Dimensions.width16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: title),
              SizedBox(height: Dimensions.height8),
              SmallText(text: subTitle),
              SizedBox(height: Dimensions.height8),
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
          ),
        ),
      ),
    );
  }
}
