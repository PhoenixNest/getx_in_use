import 'package:flutter/material.dart';
import 'package:getx_e_commerce_app/common/utils/dimensions.dart';
import 'package:getx_e_commerce_app/widgets/small_text.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconText({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize24),
        SizedBox(width: Dimensions.width8),
        SmallText(text: text),
      ],
    );
  }
}
