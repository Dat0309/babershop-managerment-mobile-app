import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/auth_controller.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/authentication/login_screen.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return userController.isLoadedProfile
          ? Container(
              color: AppColors.secondaryColor,
              padding: EdgeInsets.only(
                  top: Dimensions.widthPadding60,
                  bottom: Dimensions.widthPadding60 + 20,
                  left: Dimensions.widthPadding10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: Dimensions.widthPadding60,
                        height: Dimensions.widthPadding60,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.thirthColor,
                          image: DecorationImage(
                              image: NetworkImage(
                                userController.profile!.avatar!,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.widthPadding10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                              text:
                                  'Chào ${userController.profile!.fullName!},'),
                          SmallText(
                            text: 'Chúc bạn một ngày tốt lành!!',
                            size: Dimensions.font16 - 2,
                          ),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.find<AuthController>().logout().then(
                              (value) => Get.to(() => const LoginScreen()),
                            );
                      },
                      child: Container(
                          width: Dimensions.widthPadding100 + 50,
                          height: Dimensions.heightPadding60,
                          decoration: BoxDecoration(
                              color: AppColors.primaryBgColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)),
                          child:
                              const Center(child: BigText(text: 'ĐĂNG XUẤT')))),
                ],
              ),
            )
          : Container();
    });
  }
}
