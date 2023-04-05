// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';

class HistoryServiceCart extends StatefulWidget {
  final String image;
  final String serviceName;
  final String time;
  final int amout;
  final String paymentMethod;

  const HistoryServiceCart({
    Key? key,
    required this.image,
    required this.serviceName,
    required this.time,
    required this.amout,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  State<HistoryServiceCart> createState() => _HistoryServiceCartState();
}

class _HistoryServiceCartState extends State<HistoryServiceCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.widthPadding10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: Dimensions.radius15,
            backgroundImage: AssetImage(widget.image),
          ),
          SizedBox(
            width: Dimensions.width150,
            child: SmallText(
              text: widget.serviceName,
              color: AppColors.pargColor,
              size: Dimensions.font16,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
          SmallText(
            text: widget.time,
            color: AppColors.pargColor,
            size: Dimensions.font16,
          ),
          SmallText(
            text: widget.amout.toString(),
            color: AppColors.pargColor,
            size: Dimensions.font16,
          ),
          SmallText(
            text: widget.paymentMethod,
            color: AppColors.pargColor,
            size: Dimensions.font16,
          ),
        ],
      ),
    );
  }
}
