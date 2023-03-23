import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/hairstyle_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/hairStyle/widgets/hair_style_header.dart';
import 'package:babershop_managerment/views/hairStyle/widgets/hairstyle_widfget_card.dart';
import 'package:babershop_managerment/views/hairStyle/widgets/imageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HairStyleScreen extends StatefulWidget {
  const HairStyleScreen({super.key});

  @override
  State<HairStyleScreen> createState() => _HairStyleScreenState();
}

class _HairStyleScreenState extends State<HairStyleScreen> {
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
          child:
              GetBuilder<HairStyleController>(builder: (hairstyleController) {
            return hairstyleController.isLoaded
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const HairStyleHeader(),
                        Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.heightPadding20,
                              bottom: Dimensions.heightPadding20),
                          height: Dimensions.height1000 - 150,
                          child: StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: hairstyleController.hairstyles.length,
                            crossAxisCount: 4,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Get.to(() => ImageView(
                                    img: hairstyleController
                                        .hairstyles[index].image));
                              },
                              child: HairStyleCard(
                                  name: hairstyleController
                                      .hairstyles[index].name,
                                  image: hairstyleController
                                      .hairstyles[index].image),
                            ),
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.count((index % 7 == 0) ? 2 : 2,
                                    (index % 7 == 0) ? 3 : 3.5),
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
    );
  }
}
