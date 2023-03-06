import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String? text;
  final double? size;
  final double? height;
  final TextOverflow? textOverflow;

  const SmallText({
    Key? key,
    this.color = AppColors.mainBlackColor,
    required this.text,
    this.size = 0,
    this.height = 1.2,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? Dimensions.widthPadding17 : size,
        height: height,
        overflow: textOverflow != TextOverflow.ellipsis
            ? textOverflow
            : TextOverflow.ellipsis,
      ),
    );
  }
}
