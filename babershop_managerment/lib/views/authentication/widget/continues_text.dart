import 'package:babershop_managerment/util/dimensions.dart';
import 'package:flutter/material.dart';

class ContinuesText extends StatelessWidget {
  const ContinuesText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
            child: Divider(
          color: Colors.white,
        )),
        Expanded(
          child: Text(
            'Hoặc tiếp tục với',
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Expanded(
            child: Divider(
          color: Colors.white,
        )),
      ],
    );
  }
}
