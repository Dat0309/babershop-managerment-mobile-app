// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageView extends StatefulWidget {
  final String img;
  const ImageView({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.img,
            child: SizedBox(
              height: Dimensions.screenHeight,
              width: Dimensions.screenWidth,
              child: Image.network(
                widget.img,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: Dimensions.screenHeight,
              width: Dimensions.screenWidth,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.heightPadding60,
                        decoration: BoxDecoration(
                          color: AppColors.mainBlackColor!.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.widthPadding20),
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.heightPadding60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.pargColor!, width: 1),
                          borderRadius: BorderRadius.circular(40),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0x36FFFFFF),
                              Color(0x0FFFFFFF),
                            ],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight,
                          ),
                        ),
                        child: const BigText(text: 'Quay lại'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
