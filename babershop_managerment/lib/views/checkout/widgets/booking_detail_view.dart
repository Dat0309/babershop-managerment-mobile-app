// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:babershop_managerment/controller/anim_controller.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/controller/services_controller.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/views/home/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/booking_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/authentication/widget/button.dart';
import 'package:babershop_managerment/views/checkout/widgets/booking_detail_card.dart';
import 'package:babershop_managerment/widgets/big_text.dart';

class BookingDetailView extends StatefulWidget {
  final controller = AnimController();
  BookingDetailView({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingDetailView> createState() => _BookingDetailViewState();
}

List<String> _paymentMethod = ['Tiền mặt', 'Chuyển khoản'];

class _BookingDetailViewState extends State<BookingDetailView> {
  String paymentMethod = _paymentMethod.first;

  void createBooking(OrderController orderController) {
    orderController
        .createOrder(Get.find<ServiceController>().getBookingItems,
            paymentMethod, Get.find<ServiceController>().bookingTotalPrice)
        .then((value) {
      if (value['status']) {
        Get.find<UserController>().getProfile();
        Get.find<UserController>().updateSalary(value['user_salary']);
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: Center(
            child: Column(
              children: [
                const BigText(text: 'Thanh Toán Thành Công'),
                BigText(text: value['order'].serviceTotalPrice.toString()),
                SizedBox(
                  height: Dimensions.widthPadding30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.off(() => const NavigationPage());
                  },
                  child: const CustomButton(text: 'Về trang chủ'),
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
          'Đã có lỗi sảy ra trong quá trình thanh toán. Vui lòng kiểm tra lại thông tin!',
          backgroundColor: AppColors.primaryColor,
          colorText: AppColors.primaryBgColor,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (bookingController) {
      return AnimatedBuilder(
          animation: widget.controller,
          builder: (context, _) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.widthPadding15),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    child: const BigText(text: 'Danh sách dịch vụ'),
                  ),
                  ...List.generate(
                    bookingController.getItems.length,
                    (index) => BookingDetailCard(
                      cartItem: bookingController.getItems[index],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.heightPadding20,
                  ),
                  const BigText(text: 'Phương thức thanh toán'),
                  SizedBox(
                    height: Dimensions.heightPadding20,
                  ),
                  Container(
                    padding: EdgeInsets.all(Dimensions.widthPadding10),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: DropdownButton(
                        value: paymentMethod,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 15,
                        items: _paymentMethod
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: BigText(
                              text: value,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        }),
                  ),
                  SizedBox(
                    height: Dimensions.widthPadding20,
                  ),
                  GestureDetector(
                    onTap: () {
                      createBooking(Get.find<OrderController>());
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: 'Thanh toán dịch vụ',
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}
