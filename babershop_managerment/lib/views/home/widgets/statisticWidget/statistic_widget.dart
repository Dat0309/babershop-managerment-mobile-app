import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/home/widgets/statisticWidget/chart_statistic_of_baber.dart';
import 'package:babershop_managerment/widgets/big_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticWidget extends StatefulWidget {
  const StatisticWidget({super.key});

  @override
  State<StatisticWidget> createState() => _StatisticWidgetState();
}

class _StatisticWidgetState extends State<StatisticWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Dimensions.heightPadding15,
          left: Dimensions.widthPadding25,
          right: Dimensions.widthPadding25),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: Dimensions.heightPadding10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BigText(text: 'Giám sát doanh thu'),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.widthPadding15,
          ),
          GetBuilder<OrderController>(builder: (orderController) {
            return Column(
              children: [
                Center(
                  child: Container(
                    width: Dimensions.screenWidth,
                    height: Dimensions.height350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.secondaryColor,
                    ),
                    child: ChartStatisticsBaberWidget(
                      orders: orderController.baberAllOrderByStaff,
                    ),
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
