import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/home/widgets/app_quote.dart';
import 'package:babershop_managerment/views/home/widgets/hairstyleListTile/PageviewHairStyle.dart';
import 'package:babershop_managerment/views/home/widgets/serviceContainer/service_containre.dart';
import 'package:babershop_managerment/views/home/widgets/widgetHairstyle/widget_hairstyle.dart';
import 'package:babershop_managerment/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    Get.find<UserController>().getProfile();

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: AppColors.primaryBgColor,
        borderRadius:
            BorderRadius.circular(isDrawerOpen ? Dimensions.radius30 : 0),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
            const AppQuote(),
            const PageviewHairStyle(),
            const ServiceContainer(),
            const WidgetHairstyle(),
          ],
        ),
      ),
    );
  }
}
