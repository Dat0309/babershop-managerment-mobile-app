import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Managerment/widgets/history_service_card.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryServiceWidget extends StatefulWidget {
  const HistoryServiceWidget({super.key});

  @override
  State<HistoryServiceWidget> createState() => _HistoryServiceWidgetState();
}

class _HistoryServiceWidgetState extends State<HistoryServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController) {
      return orderController.isLoadedOrders
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.widthPadding25,
                      right: Dimensions.widthPadding25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: 'Lịch sử',
                            size: Dimensions.font24,
                          ),
                          const SmallText(
                            text: 'Giám sát lịch sử của các dịch vụ',
                            color: AppColors.pargColor,
                          ),
                        ],
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
                    height: Dimensions.height350 - 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) => HistoryServiceCart(
                            image: 'assets/images/LAMHOTTOC.png',
                            serviceName: orderController
                                .orders[index].servicesItems
                                .map((e) => e['name'].toString())
                                .join(", "),
                            time: orderController.orders[index].createdAt
                                .toString()
                                .split("T")[0],
                            amout:
                                orderController.orders[index].serviceTotalPrice,
                            paymentMethod:
                                orderController.orders[index].paymentMethod)),
                  ),
                ),
              ],
            )
          : Container();
    });
  }
}
