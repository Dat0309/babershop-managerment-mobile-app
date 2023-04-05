// ignore_for_file: unnecessary_string_escapes

import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/checkout/checkout_screen.dart';
import 'package:babershop_managerment/views/extraPrice/extra_price_screen.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceContainer extends StatefulWidget {
  const ServiceContainer({super.key});

  @override
  State<ServiceContainer> createState() => _ServiceContainerState();
}

class _ServiceContainerState extends State<ServiceContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth,
      padding: EdgeInsets.only(
        left: Dimensions.widthPadding25,
        right: Dimensions.widthPadding25,
        bottom: Dimensions.heightPadding20,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.widthPadding15),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor!,
                    blurRadius: 5.0,
                    offset: const Offset(0, 5),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BigText(
                  text: 'Tính tiền dịch vụ',
                  color: AppColors.thirthColor,
                ),
                SizedBox(
                  height: Dimensions.heightPadding10,
                ),
                const SmallText(
                  text: 'Nhấn \"Thanh toán\" để tính tiền dịch vụ',
                  color: AppColors.thirthColor,
                ),
                SizedBox(
                  height: Dimensions.heightPadding20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CheckoutScreen());
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(left: Dimensions.widthPadding300 - 45),
                    padding: EdgeInsets.all(Dimensions.widthPadding10),
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15)),
                    child: BigText(
                      text: 'Thanh Toán',
                      size: Dimensions.font16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.heightPadding15,
          ),
          Container(
            padding: EdgeInsets.all(Dimensions.widthPadding15),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor!,
                    blurRadius: 5.0,
                    offset: const Offset(0, 5),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BigText(
                  text: 'Tính tiền các chi phí phát sinh',
                  color: AppColors.thirthColor,
                ),
                SizedBox(
                  height: Dimensions.heightPadding10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Dimensions.width150,
                      child: const SmallText(
                        text:
                            'Các loại chi phí ăn uống, mua nguyên vật liệu...',
                        color: AppColors.thirthColor,
                        textOverflow: TextOverflow.visible,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ExtraPriceScreen());
                      },
                      child: Container(
                        width: Dimensions.widthPadding100,
                        height: Dimensions.widthPadding100,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.secondaryColor,
                        ),
                        child: Center(
                          child: BigText(
                            text: '+',
                            size: Dimensions.iconSize50 + 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
