import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Managerment/widgets/bar_chart_widget.dart';
import 'package:babershop_managerment/views/Managerment/widgets/managerment_infor_widget.dart';
import 'package:babershop_managerment/views/Managerment/widgets/managerment_quotes.dart';
import 'package:babershop_managerment/views/Managerment/widgets/staff_salary_widget.dart';
import 'package:babershop_managerment/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ManagermentPage extends StatefulWidget {
  const ManagermentPage({super.key});

  @override
  State<ManagermentPage> createState() => _ManagermentPageState();
}

class _ManagermentPageState extends State<ManagermentPage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  @override
  void initState() {
    Get.find<OrderController>().adminStatistics();
    super.initState();
  }

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
                    const ManagermentQuotes(),
                    const ManagermentInfoWidget(),
                    const BarChartWidget(),
                    // HistoryServiceWidget(),
                    const StaffSalaryWidget(),
                  ],
                )
              : Container();
        }),
      ),
    );
  }
}
