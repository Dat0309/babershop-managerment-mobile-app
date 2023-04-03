import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/views/home/widgets/app_quote.dart';
import 'package:babershop_managerment/views/home/widgets/hairstyleListTile/PageviewHairStyle.dart';
import 'package:babershop_managerment/views/home/widgets/serviceContainer/service_containre.dart';
import 'package:babershop_managerment/views/home/widgets/statisticWidget/statistic_widget.dart';
import 'package:babershop_managerment/views/home/widgets/widgetHairstyle/widget_hairstyle.dart';
import 'package:babershop_managerment/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.find<UserController>().getProfile();
    Get.find<OrderController>().adminStatistics();
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AppBarCustom(),
            AppQuote(),
            PageviewHairStyle(),
            ServiceContainer(),
            WidgetHairstyle(),
            StatisticWidget()
          ],
        ),
      );
    });
  }
}
