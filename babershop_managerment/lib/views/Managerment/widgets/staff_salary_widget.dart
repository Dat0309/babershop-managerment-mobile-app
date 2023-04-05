import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Managerment/widgets/staff_salary_card_widget.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffSalaryWidget extends StatefulWidget {
  const StaffSalaryWidget({super.key});

  @override
  State<StaffSalaryWidget> createState() => _StaffSalaryWidgetState();
}

class _StaffSalaryWidgetState extends State<StaffSalaryWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController) {
      return orderController.isLoadedStaffSalary
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
                            text: 'Lương thợ',
                            size: Dimensions.font24,
                          ),
                          const SmallText(
                            text: 'Xem lương thợ',
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
                    height: Dimensions.height350,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: orderController.staffSalary.length,
                        itemBuilder: (context, index) => StaffSalaryCardWidget(
                            name: orderController.staffSalary[index]
                                ['full_name'],
                            img: orderController.staffSalary[index]['avatar'],
                            salary: orderController.staffSalary[index]
                                ['salary'])),
                  ),
                )
              ],
            )
          : Container();
    });
  }
}
