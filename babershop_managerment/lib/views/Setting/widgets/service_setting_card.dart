// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/services_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Setting/detail_service_screen.dart';
import 'package:babershop_managerment/views/authentication/widget/button.dart';
import 'package:babershop_managerment/views/home/navigation.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'package:babershop_managerment/models/ServiceModel.dart';
import 'package:get/get.dart';

class ServiceSettingCard extends StatefulWidget {
  final Services services;
  const ServiceSettingCard({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  State<ServiceSettingCard> createState() => _ServiceSettingCardState();
}

class _ServiceSettingCardState extends State<ServiceSettingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.widthPadding10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.widthPadding20),
            width: Dimensions.widthPadding100 + 120,
            height: Dimensions.heightPadding60 + 20,
            decoration: BoxDecoration(
              color: AppColors.thirthColor,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor!,
                  blurRadius: 5.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                BigText(text: widget.services.name),
                SmallText(
                    text:
                        "${widget.services.price} - ${widget.services.percent.toString()}"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.find<ServiceController>()
                  .deleteServices(widget.services.id!)
                  .then((value) {
                if (value['status']) {
                  Get.find<ServiceController>().getServices();
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    body: Center(
                      child: Column(
                        children: [
                          const BigText(text: 'Xoá dịch vụ thành công'),
                          SizedBox(
                            height: Dimensions.widthPadding30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.off(() => const NavigationPage());
                            },
                            child: const CustomButton(text: 'Trở về'),
                          ),
                          SizedBox(
                            height: Dimensions.widthPadding30,
                          ),
                        ],
                      ),
                    ),
                  ).show();
                } else {
                  Get.snackbar(
                    'Không ổn rồi anh Lâm',
                    'Đã có lỗi sảy ra trong quá trình xáo dịch vụ. Vui lòng kiểm tra lại thông tin!',
                    backgroundColor: AppColors.primaryColor,
                    colorText: AppColors.primaryBgColor,
                  );
                }
              });
            },
            child: Container(
              width: Dimensions.widthPadding60,
              height: Dimensions.widthPadding60,
              decoration: BoxDecoration(
                color: AppColors.thirthColor,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor!,
                    blurRadius: 5.0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child:
                  Icon(Icons.delete, color: AppColors.primaryColor, shadows: [
                BoxShadow(
                  color: AppColors.shadowColor!,
                  blurRadius: 5.0,
                  offset: const Offset(0, 5),
                ),
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => DetailServiceScreen(
                    services: widget.services,
                  ));
            },
            child: Container(
              width: Dimensions.widthPadding60,
              height: Dimensions.widthPadding60,
              decoration: BoxDecoration(
                color: AppColors.thirthColor,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor!,
                    blurRadius: 5.0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(Icons.edit, color: AppColors.primaryColor, shadows: [
                BoxShadow(
                  color: AppColors.shadowColor!,
                  blurRadius: 5.0,
                  offset: const Offset(0, 5),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
