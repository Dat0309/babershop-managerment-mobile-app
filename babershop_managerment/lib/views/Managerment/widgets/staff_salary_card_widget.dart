// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/small_text.dart';

class StaffSalaryCardWidget extends StatefulWidget {
  final String name;
  final String img;
  final int salary;
  const StaffSalaryCardWidget({
    Key? key,
    required this.name,
    required this.img,
    required this.salary,
  }) : super(key: key);

  @override
  State<StaffSalaryCardWidget> createState() => _StaffSalaryCardWidgetState();
}

class _StaffSalaryCardWidgetState extends State<StaffSalaryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.widthPadding10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: Dimensions.radius20,
            backgroundImage: NetworkImage(widget.img),
          ),
          SmallText(
            text: widget.name,
            color: AppColors.pargColor,
            size: Dimensions.font16,
          ),
          SmallText(
            text: widget.salary.toString(),
            color: AppColors.pargColor,
            size: Dimensions.font16,
          ),
        ],
      ),
    );
  }
}
