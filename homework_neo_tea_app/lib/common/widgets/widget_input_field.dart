import 'package:flutter/material.dart';
import 'package:homework_neo_tea_app/common/values/value_color.dart';

Widget neoInputTextField({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String? hintText,
  bool isPassword = false,
  bool autofocus = false,
  bool hasIcons = false,
  IconData? icons,
  Color iconColor = AppColors.subThemeWhiteColor,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: AppColors.whiteBackgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: TextField(
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.subTextColor),
        border: InputBorder.none,
        icon: hasIcons ? Icon(icons, color: iconColor) : null,
      ),
      style: TextStyle(color: AppColors.mainTextColor),
    ),
  );
}
