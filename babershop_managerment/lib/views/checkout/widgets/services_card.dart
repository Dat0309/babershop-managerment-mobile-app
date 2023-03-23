// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/services_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/app_icon.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:babershop_managerment/models/ServiceModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesCard extends StatefulWidget {
  final Services services;
  final VoidCallback press;
  const ServicesCard({
    Key? key,
    required this.services,
    required this.press,
  }) : super(key: key);

  @override
  State<ServicesCard> createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(builder: (servicesController) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(Dimensions.radius20 * 1.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Dimensions.width150 + 50,
              height: Dimensions.height140 + 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.secondaryColor,
                image: const DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.widthPadding5),
              margin: EdgeInsets.only(
                left: Dimensions.widthPadding10,
                right: Dimensions.widthPadding10,
              ),
              decoration: BoxDecoration(
                color: AppColors.thirthColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.widthPadding10),
                    child: BigText(text: widget.services.name),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.widthPadding10),
                    child: SmallText(
                        text: '${widget.services.price.toString()} vnđ'),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.buttoBackgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius30 + 10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (qty == 1) {
                                setState(() {
                                  qty -= 1;
                                });

                                servicesController
                                    .removeBookingItem(widget.services);
                              } else if (qty > 1) {
                                setState(() {
                                  qty -= 1;
                                });

                                servicesController.updateBookingQty(
                                    widget.services.id!, qty);
                              }
                            },
                            child: const AppIcon(
                              icon: Icons.remove,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.radius20),
                            child: SmallText(text: qty.toString()),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (qty == 0) {
                                setState(() {
                                  qty += 1;
                                });
                                servicesController.addBookingItem(
                                    widget.services, qty);
                              } else {
                                setState(() {
                                  qty += 1;
                                });
                                // bookingController.updateItemQty(
                                //     widget.product.id!, qty);
                                servicesController.updateBookingQty(
                                    widget.services.id!, qty);
                              }
                            },
                            child: const AppIcon(
                              icon: Icons.add,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
