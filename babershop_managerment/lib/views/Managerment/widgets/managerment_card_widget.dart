// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

class ManagermentCardWidget extends StatefulWidget {
  final String icon;
  final String label;
  final String amount;

  const ManagermentCardWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.amount,
  }) : super(key: key);

  @override
  State<ManagermentCardWidget> createState() => _ManagermentCardWidgetState();
}

class _ManagermentCardWidgetState extends State<ManagermentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width150 + 40,
      height: Dimensions.width150 + 40,
      padding: EdgeInsets.all(Dimensions.widthPadding20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: AppColors.thirthColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.icon,
            width: Dimensions.widthPadding40,
          ),
          SmallText(
            text: widget.label,
            size: Dimensions.font16,
            color: AppColors.pargColor,
          ),
          BigText(
            text: widget.amount,
            size: Dimensions.font16 + 2,
            color: AppColors.mainBlackColor,
          ),
        ],
      ),
    );
  }
}
