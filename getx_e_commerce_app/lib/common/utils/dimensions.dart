import 'package:get/get.dart';

class Dimensions {
  // height data base of Pixel 3a XL: 816.0
  static double screenHeight = Get.context!.height;

  // width data base on Pixel 3a XL: 432.0
  static double screenWidth = Get.context!.width;

  // examples: screenHeight / 8dx ~= 102
  // width data for padding or margin
  static double height8 = screenHeight / 102.0;
  static double height10 = screenHeight / 81.6;
  static double height12 = screenHeight / 68.0;
  static double height16 = screenHeight / 51.0;
  static double height20 = screenHeight / 40.8;
  static double height24 = screenHeight / 34.0;
  static double height32 = screenHeight / 25.5;
  static double height36 = screenHeight / 22.7;
  static double height42 = screenHeight / 19.4;
  static double height52 = screenHeight / 15.6;
  static double height64 = screenHeight / 12.75;

  // width data for padding or margin
  static double width8 = screenWidth / 54.0;
  static double width10 = screenWidth / 43.2;
  static double width12 = screenWidth / 36.0;
  static double width16 = screenWidth / 27.0;
  static double width20 = screenWidth / 21.6;
  static double width24 = screenWidth / 18.0;
  static double width32 = screenWidth / 13.5;
  static double width36 = screenWidth / 12.0;
  static double width42 = screenWidth / 10.29;
  static double width52 = screenWidth / 8.31;
  static double width64 = screenWidth / 6.75;

  // radius size
  static double radius8 = screenHeight / 102.0;
  static double radius10 = screenHeight / 81.6;
  static double radius12 = screenHeight / 68.0;
  static double radius16 = screenHeight / 51.0;
  static double radius20 = screenHeight / 40.8;
  static double radius24 = screenHeight / 34.0;
  static double radius32 = screenHeight / 25.5;

  // font size
  static double fontSize12 = screenHeight / 68.0;
  static double fontSize16 = screenHeight / 51.0;
  static double fontSize24 = screenHeight / 34.0;
  static double fontSize20 = screenHeight / 40.8;
  static double fontSize32 = screenHeight / 25.5;

  // icon size
  static double iconSize16 = screenHeight / 51.0;
  static double iconSize24 = screenHeight / 34.0;

  // Ui
  // home - food
  static double foodPageView320 = screenHeight / 2.55;
  static double foodPageViewImage220 = screenHeight / 3.71;
  static double foodPageViewText120 = screenHeight / 6.8;

  static double foodListViewImage120 = screenWidth / 3.6;
  static double foodListViewText100 = screenWidth / 4.32;

  // home - food - detail
  static double detailBackgroundImage320 = screenHeight / 2.25;
  static double detailBottomBar120 = screenWidth / 3.6;
}
