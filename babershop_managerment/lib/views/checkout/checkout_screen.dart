// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/services_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/checkout/widgets/booking_detail_view.dart';
import 'package:babershop_managerment/views/checkout/widgets/checkout_header.dart';
import 'package:babershop_managerment/views/checkout/widgets/services_card.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBgColor,
        body: Container(
          color: AppColors.thirthColor,
          child: SlidingUpPanel(
            parallaxEnabled: true,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
              topRight: Radius.circular(Dimensions.radius20),
            ),
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.heightPadding15),
            minHeight: Dimensions.screenHeight / 5,
            maxHeight: Dimensions.screenHeight / 1.2,
            panel: Padding(
              padding: EdgeInsets.all(Dimensions.widthPadding15),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: BookingDetailView(),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                left: Dimensions.defaultPadding,
                right: Dimensions.defaultPadding,
                top: Dimensions.defaultPadding,
              ),
              child:
                  GetBuilder<ServiceController>(builder: (serviceController) {
                return serviceController.isLoaded
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            const CheckoutHeader(),
                            Container(
                              padding: EdgeInsets.only(
                                  top: Dimensions.heightPadding20,
                                  bottom: Dimensions.heightPadding20),
                              height: Dimensions.height350 + 200,
                              child: GridView.builder(
                                addAutomaticKeepAlives: true,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: serviceController.services.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.75,
                                  mainAxisSpacing: Dimensions.defaultPadding,
                                  crossAxisSpacing: Dimensions.defaultPadding,
                                ),
                                itemBuilder: (context, index) => ServicesCard(
                                  services: serviceController.services[index],
                                  press: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: Dimensions.defaultPadding,
                          crossAxisSpacing: Dimensions.defaultPadding,
                        ),
                        itemBuilder: (context, index) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: Dimensions.widthPadding25,
                            ),
                            child: Container(
                              width: Dimensions.width150,
                              height: Dimensions.height220,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                                color: AppColors.signColor,
                              ),
                            ),
                          ),
                        ),
                      );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
