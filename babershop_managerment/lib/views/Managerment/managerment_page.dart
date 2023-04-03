import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/views/Managerment/widgets/bar_chart_widget.dart';
import 'package:babershop_managerment/views/Managerment/widgets/history_service_widget.dart';
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
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: GetBuilder<UserController>(builder: (userController) {
        return userController.isLoadedProfile &&
                userController.profile!.role == "admin"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  AppBarCustom(),
                  ManagermentQuotes(),
                  ManagermentInfoWidget(),
                  BarChartWidget(),
                  // HistoryServiceWidget(),
                  StaffSalaryWidget(),
                ],
              )
            : Column(
                children: [],
              );
      }),
    );
  }
}
