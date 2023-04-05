// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';

class ExtrapriceCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback press;
  const ExtrapriceCard({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(Dimensions.widthPadding10),
        padding: EdgeInsets.all(Dimensions.widthPadding15),
        width: Dimensions.screenWidth,
        height: Dimensions.height120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigText(
              text: title,
              size: Dimensions.font32,
              color: AppColors.primaryBgColor,
            ),
            Icon(Icons.arrow_right_sharp,
                color: AppColors.primaryBgColor,
                size: Dimensions.widthPadding60),
          ],
        ),
      ),
    );
  }
}
