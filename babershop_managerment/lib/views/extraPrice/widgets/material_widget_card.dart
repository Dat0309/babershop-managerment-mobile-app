// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MaterialWidgetCard extends StatelessWidget {
  final String title;
  final String image;
  const MaterialWidgetCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.widthPadding15),
      child: Column(
        children: [
          Container(
            width: Dimensions.widthPadding60,
            height: Dimensions.widthPadding60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius50),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35),
                  BlendMode.multiply,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.heightPadding10,
          ),
          SizedBox(
            width: Dimensions.widthPadding100 + 20,
            child: SmallText(
              text: title,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
