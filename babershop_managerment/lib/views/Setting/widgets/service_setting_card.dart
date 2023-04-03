// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:babershop_managerment/models/ServiceModel.dart';

class ServiceSettingCard extends StatefulWidget {
  final Services services;
  const ServiceSettingCard({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  State<ServiceSettingCard> createState() => _ServiceSettingCardState();
}

class _ServiceSettingCardState extends State<ServiceSettingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.widthPadding10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.widthPadding20),
            width: Dimensions.widthPadding100 + 120,
            height: Dimensions.heightPadding60 + 20,
            decoration: BoxDecoration(
              color: AppColors.thirthColor,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor!,
                  blurRadius: 5.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                BigText(text: widget.services.name),
                SmallText(
                    text:
                        "${widget.services.price} - ${widget.services.percent.toString()}"),
              ],
            ),
          ),
          Container(
            width: Dimensions.widthPadding60,
            height: Dimensions.widthPadding60,
            decoration: BoxDecoration(
              color: AppColors.thirthColor,
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor!,
                  blurRadius: 5.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(Icons.delete, color: AppColors.primaryColor, shadows: [
              BoxShadow(
                color: AppColors.shadowColor!,
                blurRadius: 5.0,
                offset: const Offset(0, 5),
              ),
            ]),
          ),
          Container(
            width: Dimensions.widthPadding60,
            height: Dimensions.widthPadding60,
            decoration: BoxDecoration(
              color: AppColors.thirthColor,
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor!,
                  blurRadius: 5.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(Icons.edit, color: AppColors.primaryColor, shadows: [
              BoxShadow(
                color: AppColors.shadowColor!,
                blurRadius: 5.0,
                offset: const Offset(0, 5),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
