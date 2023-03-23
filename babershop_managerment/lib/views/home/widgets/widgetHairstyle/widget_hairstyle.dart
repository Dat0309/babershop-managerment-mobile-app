import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/hairstyle_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/hairStyle/hair_style_screen.dart';
import 'package:babershop_managerment/views/hairStyle/widgets/imageview.dart';
import 'package:babershop_managerment/views/home/widgets/widgetHairstyle/hairstyle_widget_card.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class WidgetHairstyle extends StatefulWidget {
  const WidgetHairstyle({super.key});

  @override
  State<WidgetHairstyle> createState() => _WidgetHairstyleState();
}

class _WidgetHairstyleState extends State<WidgetHairstyle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.heightPadding15),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: Dimensions.widthPadding25,
              bottom: Dimensions.heightPadding10,
              right: Dimensions.widthPadding25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BigText(text: 'Tư vấn kiểu tóc'),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const HairStyleScreen());
                  },
                  child: const SmallText(
                    text: 'Xem tất cả',
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.widthPadding15,
          ),
          GetBuilder<HairStyleController>(builder: (hairStyleController) {
            return hairStyleController.isLoaded
                ? SizedBox(
                    height: Dimensions.height220 + 20,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ImageView(
                                    img: hairStyleController
                                        .hairstyles[index].image));
                              },
                              child: HairstyleWidgetCard(
                                image:
                                    hairStyleController.hairstyles[index].image,
                                name:
                                    hairStyleController.hairstyles[index].name,
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const VerticalDivider(
                        color: Colors.transparent,
                        width: 5,
                      ),
                      itemCount: 10,
                    ),
                  )
                : SizedBox(
                    height: Dimensions.height220 + 20,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Shimmer.fromColors(
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
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15),
                                        color: AppColors.signColor,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const VerticalDivider(
                              color: Colors.transparent,
                              width: 5,
                            ),
                        itemCount: 10),
                  );
          })
        ],
      ),
    );
  }
}
