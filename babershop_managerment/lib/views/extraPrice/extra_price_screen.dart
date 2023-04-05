import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/extraPrice/widgets/extra_price_card.dart';
import 'package:babershop_managerment/views/extraPrice/widgets/lunch_price_screen.dart';
import 'package:babershop_managerment/views/extraPrice/widgets/material_price_screen.dart';
import 'package:babershop_managerment/views/extraPrice/widgets/more_extra_price_screen.dart';
import 'package:babershop_managerment/views/hairStyle/widgets/hair_style_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtraPriceScreen extends StatelessWidget {
  const ExtraPriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: Dimensions.defaultPadding,
            right: Dimensions.defaultPadding,
            top: Dimensions.defaultPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const HairStyleHeader(),
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.heightPadding20,
                    bottom: Dimensions.heightPadding20),
                child: Column(
                  children: [
                    ExtrapriceCard(
                        image: 'assets/images/buatrua.png',
                        title: 'Ăn Trưa',
                        press: () {
                          Get.to(() => const LunchExtraPriceScreen());
                        }),
                    ExtrapriceCard(
                        image: 'assets/images/vatlieu.jpg',
                        title: 'Mua Nguyên Vật Liệu',
                        press: () {
                          Get.to(() => const MaterialPriceScreen());
                        }),
                    ExtrapriceCard(
                        image: 'assets/images/phatsinh.jpg',
                        title: 'Chi phí khác',
                        press: () {
                          Get.to(() => const MoreExtraPriceScreen());
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
