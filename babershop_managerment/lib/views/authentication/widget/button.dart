import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Dimensions.screenHeight / 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.secondaryColor,
      ),
      child: BigText(
        text: text,
      ),
    );
  }
}
