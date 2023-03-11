import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:flutter/material.dart';

class RichTextCustom extends StatelessWidget {
  final String headerText;
  final String footerText;
  final double fontSize;

  const RichTextCustom({
    Key? key,
    required this.headerText,
    required this.footerText,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.white,
          fontSize: fontSize == 0 ? Dimensions.heightPadding20 : fontSize,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: headerText,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: footerText,
            style: const TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
