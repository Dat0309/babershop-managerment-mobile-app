// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'package:babershop_managerment/models/CartModel.dart';

class BookingDetailCard extends StatelessWidget {
  final Cart cartItem;
  const BookingDetailCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          EdgeInsets.symmetric(vertical: Dimensions.defaultPadding / 2),
      leading: CircleAvatar(
        radius: Dimensions.radius30,
        backgroundColor: AppColors.primaryBgColor,
        backgroundImage: const AssetImage('assets/images/LAMHOTTOC.png'),
      ),
      title: BigText(
        text: cartItem.name,
        size: Dimensions.font16,
        color: AppColors.mainBlackColor,
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            BigText(
              text: "${cartItem.price} vnđ",
              size: Dimensions.font16,
              color: AppColors.mainBlackColor,
            ),
            SizedBox(
              width: Dimensions.widthPadding5,
            ),
            SmallText(
              text: "x${cartItem.qty}",
              size: Dimensions.font16 - 3,
              color: AppColors.pargColor,
            ),
          ],
        ),
      ),
    );
  }
}
