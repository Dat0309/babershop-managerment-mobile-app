import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Setting/detail_service_screen.dart';
import 'package:babershop_managerment/views/Setting/widgets/list_service_setting_widget.dart';
import 'package:babershop_managerment/views/Setting/widgets/setting_quotes.dart';
import 'package:babershop_managerment/views/authentication/widget/button.dart';
import 'package:babershop_managerment/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: AppColors.primaryBgColor,
        borderRadius:
            BorderRadius.circular(isDrawerOpen ? Dimensions.radius50 : 0),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GetBuilder<UserController>(builder: (userController) {
          return userController.isLoadedProfile &&
                  userController.profile!.role == "admin"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarCustom(
                      isDrawerOpen: isDrawerOpen,
                      press: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                        });
                      },
                      pressDrawerOpen: () {
                        setState(() {
                          xOffset = Dimensions.widthPadding300 - 100;
                          yOffset = Dimensions.height120;
                          scaleFactor = 0.8;
                          isDrawerOpen = true;
                        });
                      },
                    ),
                    const SettingQuotesWidget(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.widthPadding25,
                        right: Dimensions.widthPadding25,
                        bottom: Dimensions.widthPadding40,
                        top: Dimensions.widthPadding20,
                      ),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(() => const DetailServiceScreen());
                          },
                          child: const CustomButton(text: 'Thêm dịch vụ')),
                    ),
                    const ListServiceSettingWidget(),
                  ],
                )
              : Container();
        }),
      ),
    );
  }
}
