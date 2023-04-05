// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';

class HairStyleCard extends StatefulWidget {
  final String name;
  final String image;
  const HairStyleCard({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  State<HairStyleCard> createState() => _HairStyleCardState();
}

class _HairStyleCardState extends State<HairStyleCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: (Dimensions.widthPadding300 + 65) / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  AppColors.mainBlackColor!.withOpacity(0.55),
                  BlendMode.multiply),
              fit: BoxFit.cover,
              image: NetworkImage(widget.image),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor!,
                blurRadius: 5.0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.widthPadding10,
            right: Dimensions.widthPadding10,
            bottom: Dimensions.widthPadding10,
          ),
          width: (Dimensions.widthPadding300 + 65) / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: widget.name,
                color: AppColors.primaryBgColor,
                size: Dimensions.font16 + 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
