import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final Color? color;

  const TextFieldCustom({
    Key? key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Dimensions.screenHeight / 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        color: color ?? AppColors.primaryBgColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.heightPadding15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.mainBlackColor,
            ),
            SizedBox(
              width: Dimensions.widthPadding30,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: 1,
                cursorColor: Colors.white70,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: Dimensions.font16,
                  color: AppColors.mainBlackColor,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: Dimensions.font16,
                    color: AppColors.mainBlackColor!.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
