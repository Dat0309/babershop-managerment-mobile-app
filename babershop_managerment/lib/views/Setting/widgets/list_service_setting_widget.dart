import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/services_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Setting/widgets/service_setting_card.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListServiceSettingWidget extends StatefulWidget {
  const ListServiceSettingWidget({super.key});

  @override
  State<ListServiceSettingWidget> createState() =>
      _ListServiceSettingWidgetState();
}

class _ListServiceSettingWidgetState extends State<ListServiceSettingWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(builder: (serviceController) {
      return serviceController.isLoaded
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
                            text: 'Danh sách dịch vụ',
                            size: Dimensions.font24,
                          ),
                          const SmallText(
                            text: 'Danh sách các dịch vụ của cả 2 tiệm',
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
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: serviceController.services.length,
                      itemBuilder: (context, index) => ServiceSettingCard(
                          services: serviceController.services[index])),
                )
              ],
            )
          : Container();
    });
  }
}
