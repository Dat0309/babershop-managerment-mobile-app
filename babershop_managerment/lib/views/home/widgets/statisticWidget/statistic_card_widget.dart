// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:flutter/material.dart';

class StatisticsCardWidget extends StatefulWidget {
  final String name;
  final int price;

  const StatisticsCardWidget({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  State<StatisticsCardWidget> createState() => _StatisticsCardWidgetState();
}

class _StatisticsCardWidgetState extends State<StatisticsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.widthPadding10, right: Dimensions.widthPadding10),
      padding: EdgeInsets.all(Dimensions.widthPadding10),
      width: Dimensions.width150 + 40,
      height: Dimensions.width150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: AppColors.primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ]),
      child: Center(
        child: Column(
          children: [
            Container(
              width: Dimensions.width150 + 20,
              height: Dimensions.heightPadding45,
              padding: EdgeInsets.all(Dimensions.widthPadding10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.secondaryColor,
              ),
              child: Center(
                child: BigText(
                  text: widget.name,
                  color: AppColors.primaryBgColor,
                  size: Dimensions.font24 - 2,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.heightPadding20,
            ),
            BigText(
              text: '${widget.price}đ',
              size: Dimensions.font24 - 4,
              color: AppColors.primaryBgColor,
            ),
          ],
        ),
      ),
    );
  }
}
