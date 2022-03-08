import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget neoSocialButton({
  required Color color,
  required String icon,
  required VoidCallback press,
}) {
  return GestureDetector(
    onTap: press,
    child: ClipOval(
      child: Container(
        padding: EdgeInsets.all(16),
        color: color,
        child: SvgPicture.asset(
          icon,
          height: 24,
          width: 24,
        ),
      ),
    ),
  );
}
