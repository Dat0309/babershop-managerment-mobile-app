// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';

class HairstyleWidgetCard extends StatefulWidget {
  final String name;
  final String image;

  const HairstyleWidgetCard({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  State<HairstyleWidgetCard> createState() => _HairstyleWidgetCardState();
}

class _HairstyleWidgetCardState extends State<HairstyleWidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.widthPadding25,
      ),
      child: Stack(
        children: [
          Container(
            width: Dimensions.width150,
            height: Dimensions.height220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.image,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor!,
                  blurRadius: 5.0,
                  offset: const Offset(0, 5),
                )
              ],
            ),
          ),
          SizedBox(
            width: Dimensions.width150,
            height: Dimensions.height200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: Dimensions.widthPadding8,
                        top: Dimensions.heightPadding8,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.widthPadding8,
                        vertical: Dimensions.widthPadding8,
                      ),
                      child: Image.asset(
                        'assets/icons/hearth.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: Dimensions.heightPadding10,
                        left: Dimensions.widthPadding8,
                        right: Dimensions.widthPadding10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Dimensions.width140 - 7,
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.widthPadding5,
                              horizontal: Dimensions.widthPadding8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius8),
                              color:
                                  AppColors.mainBlackColor!.withOpacity(0.55),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: widget.name,
                                  size: Dimensions.font16,
                                  color: AppColors.thirthColor,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
