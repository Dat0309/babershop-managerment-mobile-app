import 'package:babershop_managerment/util/dimensions.dart';
import 'package:flutter/cupertino.dart';

import '../../../constant/textstyle_constant.dart';
import '../../../helper/image_helper.dart';

class ItemIntroWidget extends StatelessWidget {
  const ItemIntroWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.sourceImage,
    required this.aligment,
  }) : super(key: key);

  final String title;
  final String description;
  final String sourceImage;
  final AlignmentGeometry aligment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: aligment,
          child: ImageHelper.loadFromAsset(
            sourceImage,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(
          height: Dimensions.widthPadding25 * 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.widthPadding25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.setTextSize(24).bold,
              ),
              SizedBox(
                height: Dimensions.widthPadding25,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
