import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserController>(builder: (userController) {
        userController.getTempSalary();
        return userController.isLoadedProfile
            ? SafeArea(
                top: true,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Image.network(
                        userController.profile!.avatar!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(0, 42, 43, 47),
                                Color(0x6041444B),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin:
                                    EdgeInsets.all(Dimensions.widthPadding20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            Dimensions.widthPadding30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            BigText(
                                              text: userController
                                                  .profile!.fullName,
                                              color: AppColors.primaryBgColor,
                                              size: Dimensions.font32,
                                            ),
                                            SmallText(
                                              text: userController
                                                          .profile!.role ==
                                                      'admin'
                                                  ? 'Ông chủ'
                                                  : 'Nhân viên',
                                              color: AppColors.primaryBgColor,
                                              size: Dimensions.font24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(
                                          Dimensions.widthPadding15),
                                      width: Dimensions.screenWidth,
                                      height: Dimensions.height140,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryBgColor!
                                            .withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Align(
                                            alignment: Alignment.topLeft,
                                            child: BigText(
                                              text: 'Lương hôm nay',
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: BigText(
                                                text:
                                                    '${userController.tempSalary} vnđ'),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              userController.clearSalary();
                                            },
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                padding: EdgeInsets.all(
                                                    Dimensions.widthPadding15),
                                                decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius15),
                                                ),
                                                child: BigText(
                                                  text: 'Nhận lương',
                                                  color:
                                                      AppColors.primaryBgColor,
                                                  size: Dimensions.font24,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.heightPadding20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(
                                          Dimensions.widthPadding15),
                                      width: Dimensions.screenWidth,
                                      height: Dimensions.height140,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryBgColor!
                                            .withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Align(
                                            alignment: Alignment.topLeft,
                                            child: BigText(
                                              text: 'Số dịch vụ hôm nay',
                                            ),
                                          ),
                                          const Align(
                                            alignment: Alignment.center,
                                            child: BigText(text: '3 Dịch vụ'),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                  Dimensions.widthPadding15),
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius15),
                                              ),
                                              child: BigText(
                                                text: 'Xem tất cả',
                                                color: AppColors.primaryBgColor,
                                                size: Dimensions.font24,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )
            : Container();
      }),
    );
  }
}
