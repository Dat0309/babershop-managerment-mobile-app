import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({
    super.key,
  });

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
          Image.asset(
            'assets/icons/menu.png',
            height: Dimensions.widthPadding25,
            width: Dimensions.widthPadding25,
            fit: BoxFit.cover,
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
