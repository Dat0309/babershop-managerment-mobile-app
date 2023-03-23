// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/anim_controller.dart';
import 'package:babershop_managerment/controller/services_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/small_text.dart';

class BookingShortView extends StatefulWidget {
  final controller = AnimController();
  BookingShortView({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingShortView> createState() => _BookingShortViewState();
}

class _BookingShortViewState extends State<BookingShortView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(builder: (controller) {
      return AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.widthPadding8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                  ),
                  child: const SmallText(text: 'Danh sách dịch vụ'),
                ),
                SizedBox(
                  width: Dimensions.defaultPadding,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.getBookingItems.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                              right: Dimensions.defaultPadding / 2),
                          child: Hero(
                            tag:
                                "${controller.getBookingItems[index].serviceId}_bookingTag",
                            child: const CircleAvatar(
                              backgroundColor: AppColors.thirthColor,
                              backgroundImage:
                                  AssetImage('assets/images/LAMHOTTOC.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                    backgroundColor: AppColors.primaryBgColor,
                    child: SmallText(
                      text: controller.bookingTotalItem.toString(),
                      color: AppColors.primaryColor,
                    )),
              ],
            );
          });
    });
  }
}
