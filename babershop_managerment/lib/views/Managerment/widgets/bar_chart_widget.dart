import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/home/widgets/statisticWidget/chart_statistic_of_baber.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({super.key});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.widthPadding25,
              right: Dimensions.widthPadding25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: 'Biểu đồ doanh thu',
                size: Dimensions.font24,
              ),
              const SmallText(
                text: 'Giám sát doanh thu tiệm qua biểu đồ',
                color: AppColors.pargColor,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              top: Dimensions.widthPadding25,
              bottom: Dimensions.widthPadding25),
          width: Dimensions.screenWidth,
          height: Dimensions.height350,
          margin: EdgeInsets.only(
              left: Dimensions.widthPadding25,
              right: Dimensions.widthPadding25),
          child: GetBuilder<OrderController>(builder: (orderController) {
            return orderController.isLoadedAdminStatistics
                ? ChartStatisticsBaberWidget(
                    name: 'Thống kê doanh thu của 2 tiệm',
                    statistics: orderController.statistiscModel)
                : Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: Dimensions.widthPadding300 + 70,
                        height: Dimensions.widthPadding300,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.signColor,
                        ),
                      ),
                    ),
                  );
          }),
        ),
        Container(
          padding: EdgeInsets.only(bottom: Dimensions.widthPadding25),
          width: Dimensions.screenWidth,
          height: Dimensions.height350,
          margin: EdgeInsets.only(
              left: Dimensions.widthPadding25,
              right: Dimensions.widthPadding25),
          child: GetBuilder<OrderController>(builder: (orderController) {
            return orderController.isLoadedAdminStatistics
                ? ChartStatisticsBaberWidget(
                    name: 'Thống kê doanh thu của tiệm 1',
                    statistics: orderController.statistiscModelShop1)
                : Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: Dimensions.widthPadding300 + 70,
                        height: Dimensions.widthPadding300,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.signColor,
                        ),
                      ),
                    ),
                  );
          }),
        ),
        Container(
          padding: EdgeInsets.only(bottom: Dimensions.widthPadding25),
          width: Dimensions.screenWidth,
          height: Dimensions.height350,
          margin: EdgeInsets.only(
              left: Dimensions.widthPadding25,
              right: Dimensions.widthPadding25),
          child: GetBuilder<OrderController>(builder: (orderController) {
            return orderController.isLoadedAdminStatistics
                ? ChartStatisticsBaberWidget(
                    name: 'Thống kê doanh thu của tiệm 2',
                    statistics: orderController.statistiscModelShop2)
                : Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: Dimensions.widthPadding300 + 70,
                        height: Dimensions.widthPadding300,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.signColor,
                        ),
                      ),
                    ),
                  );
          }),
        ),
      ],
    );
  }
}
