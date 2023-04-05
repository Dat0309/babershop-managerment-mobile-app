import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/hairstyle_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/home/widgets/hairstyleListTile/hairstyle_pageview_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PageviewHairStyle extends StatefulWidget {
  const PageviewHairStyle({super.key});

  @override
  State<PageviewHairStyle> createState() => _PageviewHairStyleState();
}

class _PageviewHairStyleState extends State<PageviewHairStyle> {
  final PageController pageController = PageController(viewportFraction: 0.75);

  int curPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      int position = pageController.page!.round();
      if (curPage != position) {
        {
          setState(() {
            curPage = position;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.widthPadding25,
        bottom: Dimensions.widthPadding25,
      ),
      child: GetBuilder<HairStyleController>(builder: (hairstyleController) {
        return hairstyleController.isLoadedLimit
            ? SizedBox(
                height: Dimensions.height350 + 50,
                child: PageView.builder(
                  padEnds: false,
                  controller: pageController,
                  itemCount: hairstyleController.limitHairstyle.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    bool active = index == curPage;
                    return Opacity(
                      opacity: curPage == index ? 1.0 : 0.5,
                      child: GestureDetector(
                        onTap: () {},
                        child: HairStylePageviewCard(
                          active: active,
                          index: index,
                          hairStyle: hairstyleController.limitHairstyle[index],
                        ),
                      ),
                    );
                  },
                ),
              )
            : SizedBox(
                height: Dimensions.height350 + 50,
                child: PageView.builder(
                  padEnds: false,
                  controller: pageController,
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Opacity(
                        opacity: curPage == index ? 1.0 : 0.5,
                        child: GestureDetector(
                          onTap: () {},
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              margin: EdgeInsets.only(
                                left: Dimensions.widthPadding25,
                              ),
                              child: Container(
                                width: Dimensions.widthPadding300,
                                height: Dimensions.height350 + 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
                                  color: AppColors.signColor,
                                ),
                              ),
                            ),
                          ),
                        ));
                  },
                ),
              );
      }),
    );
  }
}
