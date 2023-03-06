// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';

class WidgetButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  const WidgetButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Dimensions.screenHeight / 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: BigText(
        text: text,
        color: textColor,
      ),
    );
  }
}
