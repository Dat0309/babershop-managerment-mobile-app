import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/services_controller.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/app_icon.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutHeader extends StatefulWidget {
  const CheckoutHeader({super.key});

  @override
  State<CheckoutHeader> createState() => _CheckoutHeaderState();
}

class _CheckoutHeaderState extends State<CheckoutHeader> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.only(
          top: Dimensions.widthPadding20,
          left: Dimensions.widthPadding25,
          right: Dimensions.widthPadding25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  controller.clearBooking();
                  Get.back();
                },
                child: const AppIcon(icon: Icons.arrow_back_ios)),
            Column(
              children: [
                const SmallText(text: 'Nhân viên'),
                GetBuilder<UserController>(builder: (user) {
                  return BigText(text: user.profile!.fullName);
                })
              ],
            ),
            GetBuilder<UserController>(builder: (user) {
              return user.isLoadedProfile
                  ? Container(
                      width: Dimensions.widthPadding60,
                      height: Dimensions.widthPadding60,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
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
    });
  }
}
