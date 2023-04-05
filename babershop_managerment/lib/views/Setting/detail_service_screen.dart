// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/services_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/authentication/widget/button.dart';
import 'package:babershop_managerment/views/authentication/widget/text_field.dart';
import 'package:babershop_managerment/views/hairStyle/widgets/hair_style_header.dart';
import 'package:babershop_managerment/views/home/navigation.dart';
import 'package:babershop_managerment/widgets/big_text.dart';

import 'package:babershop_managerment/models/ServiceModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailServiceScreen extends StatefulWidget {
  final Services? services;
  const DetailServiceScreen({
    Key? key,
    this.services,
  }) : super(key: key);

  @override
  State<DetailServiceScreen> createState() => _DetailServiceScreenState();
}

class _DetailServiceScreenState extends State<DetailServiceScreen> {
  @override
  Widget build(BuildContext context) {
    var serviceNameController = TextEditingController(
        text: widget.services != null ? widget.services?.name : "");
    var priceController = TextEditingController(
        text: widget.services != null ? widget.services?.price.toString() : "");
    var percentController = TextEditingController(
        text:
            widget.services != null ? widget.services?.percent.toString() : "");

    void handleFunc(ServiceController servicesController) {
      if (widget.services == null) {
        servicesController
            .createServices(
                serviceNameController.text,
                int.parse(priceController.text),
                double.parse(percentController.text))
            .then((value) {
          if (value['status']) {
            servicesController.getServices();
            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Center(
                child: Column(
                  children: [
                    const BigText(text: 'Thêm dịch vụ thành công'),
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
              'Đã có lỗi sảy ra trong quá trình thêm dịch vụ. Vui lòng kiểm tra lại thông tin!',
              backgroundColor: AppColors.primaryColor,
              colorText: AppColors.primaryBgColor,
            );
          }
        });
      } else {
        servicesController.updateServices(widget.services!).then((value) {
          if (value['status']) {
            servicesController.getServices();

            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Center(
                child: Column(
                  children: [
                    const BigText(text: 'Sửa dịch vụ thành công'),
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
              'Đã có lỗi sảy ra trong quá trình sửa dịch vụ. Vui lòng kiểm tra lại thông tin!',
              backgroundColor: AppColors.primaryColor,
              colorText: AppColors.primaryBgColor,
            );
          }
        });
      }
    }

    return widget.services != null
        ? SafeArea(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HairStyleHeader(),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.defaultPadding),
                    child: Column(
                      children: [
                        TextFieldCustom(
                            hint: serviceNameController.text,
                            icon: Icons.design_services,
                            controller: serviceNameController),
                        SizedBox(
                          height: Dimensions.heightPadding20,
                        ),
                        TextFieldCustom(
                            hint: "${priceController.text}vnđ",
                            icon: Icons.price_change,
                            controller: priceController),
                        SizedBox(
                          height: Dimensions.heightPadding20,
                        ),
                        TextFieldCustom(
                            hint: percentController.text,
                            icon: Icons.percent,
                            controller: percentController),
                        SizedBox(
                          height: Dimensions.heightPadding45,
                        ),
                        GestureDetector(
                          onTap: () {
                            handleFunc(Get.find<ServiceController>());
                          },
                          child: const CustomButton(text: 'Sửa dịch vụ'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HairStyleHeader(),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.defaultPadding),
                    child: Column(
                      children: [
                        TextFieldCustom(
                            hint: 'Tên dịch vụ',
                            icon: Icons.design_services,
                            controller: serviceNameController),
                        SizedBox(
                          height: Dimensions.heightPadding20,
                        ),
                        TextFieldCustom(
                            hint: "Giá cả dịch vụ",
                            icon: Icons.price_change,
                            controller: priceController),
                        SizedBox(
                          height: Dimensions.heightPadding20,
                        ),
                        TextFieldCustom(
                            hint: "Phần trăm thợ",
                            icon: Icons.percent,
                            controller: percentController),
                        SizedBox(
                          height: Dimensions.heightPadding45,
                        ),
                        GestureDetector(
                          onTap: () {
                            handleFunc(Get.find<ServiceController>());
                          },
                          child: const CustomButton(text: 'Thêm dịch vụ'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
