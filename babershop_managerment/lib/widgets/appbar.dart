// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';

class AppBarCustom extends StatefulWidget {
  final bool isDrawerOpen;
  final VoidCallback press;
  final VoidCallback pressDrawerOpen;
  const AppBarCustom({
    Key? key,
    required this.isDrawerOpen,
    required this.press,
    required this.pressDrawerOpen,
  }) : super(key: key);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.widthPadding20,
        left: Dimensions.widthPadding25,
        right: Dimensions.widthPadding25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isDrawerOpen
              ? GestureDetector(
                  onTap: widget.press,
                  child: Image.asset(
                    'assets/icons/menu.png',
                    height: Dimensions.widthPadding25,
                    width: Dimensions.widthPadding25,
                    fit: BoxFit.cover,
                  ),
                )
              : GestureDetector(
                  onTap: widget.pressDrawerOpen,
                  child: Image.asset(
                    'assets/icons/menu.png',
                    height: Dimensions.widthPadding25,
                    width: Dimensions.widthPadding25,
                    fit: BoxFit.cover,
                  ),
                ),
          GetBuilder<UserController>(builder: (user) {
            return user.isLoadedProfile
                ? Container(
                    width: Dimensions.widthPadding60,
                    height: Dimensions.widthPadding60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.thirthColor,
                      image: DecorationImage(
                          image: NetworkImage(
                            user.profile!.avatar!,
                          ),
                          fit: BoxFit.cover),
                    ),
                  )
                : Container(
                    width: Dimensions.widthPadding60,
                    height: Dimensions.widthPadding60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.thirthColor,
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
