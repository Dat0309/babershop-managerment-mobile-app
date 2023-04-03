import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/home/widgets/statisticWidget/chart_statistic_of_baber.dart';
import 'package:babershop_managerment/views/home/widgets/statisticWidget/statistic_card_widget.dart';
import 'package:babershop_managerment/widgets/big_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
          GetBuilder<UserController>(builder: (userController) {
            return userController.isLoadedProfile &&
                    userController.profile!.role == "admin"
                ? GetBuilder<OrderController>(builder: (orderController) {
                    return orderController.isLoadedAdminStatistics
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  width: Dimensions.screenWidth,
                                  height: Dimensions.height350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.secondaryColor,
                                  ),
                                  child: ChartStatisticsBaberWidget(
                                    name: 'Thống kê doanh thu của 2 tiệm',
                                    statistics: orderController.statistiscModel,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StatisticsCardWidget(
                                      name: 'Tổng doanh thu',
                                      price: orderController
                                          .statistiscModel!.revenue!),
                                  StatisticsCardWidget(
                                      name: 'Số tiền chi ra',
                                      price: orderController
                                          .statistiscModel!.extraCost!),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StatisticsCardWidget(
                                      name: 'Lương của thợ',
                                      price: orderController
                                          .statistiscModel!.staffSalary!),
                                  StatisticsCardWidget(
                                      name: 'Số dư',
                                      price: orderController
                                          .statistiscModel!.surplus!),
                                ],
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: Dimensions.widthPadding25,
                                    ),
                                    child: Container(
                                      width: Dimensions.widthPadding300 + 70,
                                      height: Dimensions.widthPadding300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15),
                                        color: AppColors.signColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: Dimensions.widthPadding10,
                                          top: Dimensions.widthPadding10),
                                      child: Container(
                                        width: Dimensions.width150 + 40,
                                        height: Dimensions.width150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15),
                                          color: AppColors.signColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: Dimensions.widthPadding10,
                                          top: Dimensions.widthPadding10),
                                      child: Container(
                                        width: Dimensions.width150 + 40,
                                        height: Dimensions.width150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15),
                                          color: AppColors.signColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: Dimensions.widthPadding10,
                                          top: Dimensions.widthPadding10),
                                      child: Container(
                                        width: Dimensions.width150 + 40,
                                        height: Dimensions.width150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15),
                                          color: AppColors.signColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: Dimensions.widthPadding10,
                                          top: Dimensions.widthPadding10),
                                      child: Container(
                                        width: Dimensions.width150 + 40,
                                        height: Dimensions.width150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15),
                                          color: AppColors.signColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                  })
                : Container();
          })
        ],
      ),
    );
  }
}
