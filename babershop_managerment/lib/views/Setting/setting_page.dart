import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Setting/detail_service_screen.dart';
import 'package:babershop_managerment/views/Setting/widgets/list_service_setting_widget.dart';
import 'package:babershop_managerment/views/Setting/widgets/setting_quotes.dart';
import 'package:babershop_managerment/views/authentication/widget/button.dart';
import 'package:babershop_managerment/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: GetBuilder<UserController>(builder: (userController) {
        return userController.isLoadedProfile &&
                userController.profile!.role == "admin"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarCustom(),
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
            : Column(
                children: [],
              );
      }),
    );
  }
}
