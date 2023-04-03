// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Managerment/widgets/managerment_card_widget.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ManagermentInfoWidget extends StatefulWidget {
  const ManagermentInfoWidget({super.key});

  @override
  State<ManagermentInfoWidget> createState() => _ManagermentInfoWidgetState();
}

class _ManagermentInfoWidgetState extends State<ManagermentInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.widthPadding25,
        bottom: Dimensions.widthPadding25,
      ),
      child: GetBuilder<OrderController>(builder: (orderController) {
        return orderController.isLoadedAdminStatistics
            ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: Dimensions.heightPadding10,
                      left: Dimensions.widthPadding25,
                      right: Dimensions.widthPadding25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: 'Giám sát doanh thu',
                          size: Dimensions.font24,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.widthPadding25,
                        right: Dimensions.widthPadding25),
                    child: SizedBox(
                      width: Dimensions.screenWidth,
                      child: Wrap(
                        spacing: Dimensions.widthPadding20,
                        runSpacing: Dimensions.widthPadding20,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          ManagermentCardWidget(
                              icon: 'assets/icons/revenue.png',
                              label: 'Tổng doanh thu \ncủa 2 tiệm',
                              amount:
                                  '${orderController.statistiscModel!.revenue} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/refund.png',
                              label: 'Tiền chi ra \nMau nguyên liệu, ăn trưa',
                              amount:
                                  '${orderController.statistiscModel!.extraCost} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/salary.png',
                              label: 'Lương thợ \ncả 2 tiệm',
                              amount:
                                  '${orderController.statistiscModel!.staffSalary} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/sales.png',
                              label: 'Số dư \ncủa 2 tiệm',
                              amount: orderController.statistiscModel!.surplus
                                      .toString() +
                                  ' đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/revenue.png',
                              label: 'Tổng doanh thu \nTiệm 1',
                              amount:
                                  '${orderController.statistiscModel!.revenue} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/revenue.png',
                              label: 'Tổng doanh thu \nTiệm 2',
                              amount:
                                  '${orderController.statistiscModel!.revenue} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/refund.png',
                              label: 'Tiền chi ra \nTiệm 1',
                              amount:
                                  '${orderController.statistiscModel!.extraCost} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/refund.png',
                              label: 'Tiền chi ra \nTiệm 2',
                              amount:
                                  '${orderController.statistiscModel!.extraCost} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/salary.png',
                              label: 'Lương thợ \nTiệm 1',
                              amount:
                                  '${orderController.statistiscModel!.staffSalary} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/salary.png',
                              label: 'Lương thợ \nTiệm 2',
                              amount:
                                  '${orderController.statistiscModel!.staffSalary} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/sales.png',
                              label: 'Số dư \nTiệm 1',
                              amount: orderController.statistiscModel!.surplus
                                      .toString() +
                                  ' đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/sales.png',
                              label: 'Số dư \nTiệm 2',
                              amount: orderController.statistiscModel!.surplus
                                      .toString() +
                                  ' đ'),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox();
      }),
    );
  }
}
